class User::LoginAccount < ActiveRecord::Base
  belongs_to :user
  serialize :info, Hash

  def self.build_from_auth_hash(auth_hash)
    account = self.new
    account.assign_account_info(auth_hash)
    account
  end

  def self.create_from_auth_hash(auth_hash)
    account = build_from_auth_hash(auth_hash)
    account.save
    account
  end
end

