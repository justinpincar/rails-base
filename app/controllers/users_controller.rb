class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    load_user
    redirect_to selling_user_path(@user)
  end

  private

  def load_user
    @user = User.find(params[:id])
  end
end

