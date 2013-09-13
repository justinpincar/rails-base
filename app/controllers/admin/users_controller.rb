class Admin::UsersController < AdminController
  def index
    @users = User.limit(20)
  end

  def goto
    if params[:id].present? && params[:id].to_i > 0
      redirect_to admin_user_path(params[:id].to_i)
    else
      redirect_to admin_users_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @query = params[:q]
    @users = User.where("name like ? or nickname like ? or email like ?", "%#{@query}%", "%#{@query}%", "%#{@query}%")
  end

  def impersonate
    @user = User.find(params[:id])
    authorize!(:impersonate, @user)
    if user_signed_in?
      sign_out(:user)
    end
    sign_in(@user)
    redirect_to root_path
  end
end

