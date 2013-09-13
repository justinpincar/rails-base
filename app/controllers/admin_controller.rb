class AdminController < ApplicationController
  before_filter :authenticate

  def index; end

  protected

  def authenticate
    authenticate_user!

    unless current_user.admin?
      raise ::CanCan::AccessDenied
    end
  end
end

