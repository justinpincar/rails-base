class Admin::PreLaunchSubscribersController < AdminController
  layout false

  def index
    render :csv => PreLaunchSubscriber.all
  end
end

