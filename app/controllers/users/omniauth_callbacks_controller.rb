class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def passthru
    render :nothing => true, :status => 404, :layout => false
  end

  def facebook
    unless auth_hash && auth_hash['uid']
      flash[:notice] = "Could not authorize you from Facebook"
      redirect_to(root_path) and return
    end

    account = User::FacebookAccount.where(:remote_account_id => auth_hash['uid']).first
    if account.present?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", :kind => "Facebook")
      sign_in_and_redirect(account.user, :event => :authentication)
    else
      account = User::FacebookAccount.build_from_auth_hash(auth_hash)
      if account.email.present?
        user = User.where(:email => account.email).first
        if user.present?
          account.user = user
          account.save!
          sign_in_and_redirect user, :event => :authentication
          return
        end
      end

      user = User.new
      account.populate_user_info(user)
      user.login_accounts = [account]

      if user.save
        flash[:notice] = I18n.t("devise.omniauth_callbacks.success", :kind => "Facebook")
        sign_in_and_redirect user, :event => :authentication
      else
        # TODO: Better error handling
        session['devise.omniauth'] = auth_hash.except('extra')
        redirect_to (session[:omniauth_redirect_url] || new_user_registration_path)
      end
    end
  end

  def twitter
    unless auth_hash && auth_hash['uid']
      flash[:notice] = "Could not authorize you from Twitter"
      redirect_to(root_path) and return
    end

    account = User::TwitterAccount.where(:remote_account_id => auth_hash['uid']).first
    if account.present?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", :kind => "Twitter")
      sign_in_and_redirect(account.user, :event => :authentication)
    else
      session['devise.omniauth'] = auth_hash.except('extra')
      redirect_to (session[:omniauth_redirect_url] || new_user_registration_path)
    end
  end

  private

  def auth_hash
    @auth_hash ||= env["omniauth.auth"]
  end
end
