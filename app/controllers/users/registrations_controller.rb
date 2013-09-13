class Users::RegistrationsController < Devise::RegistrationsController
  def new
    session[:omniauth_redirect_url] = omniauth_redirect_url
    build_resource
    if session['devise.omniauth'].present? && session['devise.omniauth']['info'].present?
      name = session['devise.omniauth']['info']['name']
      email = session['devise.omniauth']['info']['email']
    end
    @user.email = email if (email && email != "null")
  end

  protected

  def after_sign_up_path_for(resource_or_scope)
    root_path
  end

  def omniauth_redirect_url
    new_user_registration_path
  end

  def build_resource(*args)
    super
    if session['devise.omniauth']
      @user.apply_omniauth!(session['devise.omniauth'])
      @user.valid?
    end
  end
end

