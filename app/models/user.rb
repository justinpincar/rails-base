class User < ActiveRecord::Base
  devise :database_authenticatable, :token_authenticatable, :rememberable, :registerable, :omniauthable, :recoverable, :validatable

  has_one :image, :as => :imageable, :dependent => :destroy
  has_many :authorizations

  attr_accessible :email, :password, :password_confirmation

  scope :ordered, order("users.created_at DESC")

  def admin?
    authorizations.where(:role => Authorization.admin).any?
  end

  def apply_omniauth! auth_hash
    account_clazz = case auth_hash['provider']
                    when 'twitter' then
                      User::TwitterAccount
                    when 'facebook' then
                      User::FacebookAccount
                    end
    account = account_clazz.build_from_auth_hash auth_hash
    self.login_accounts = [account]
  end

  def self.find_by_facebook_id(remote_account_id)
    login_account = User::FacebookAccount.where(:remote_account_id => remote_account_id).where("user_id is not null").first
    return login_account.try(:user)
  end

  def self.find_by_twitter_id(remote_account_id)
    login_account = User::TwitterAccount.where(:remote_account_id => remote_account_id).where("user_id is not null").first
    return login_account.try(:user)
  end
end

