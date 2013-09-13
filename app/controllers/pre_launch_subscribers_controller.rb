class PreLaunchSubscribersController < ApplicationController
  layout false

  def new
    @pre_launch_subscriber = PreLaunchSubscriber.new
  end

  def create
    @pre_launch_subscriber = PreLaunchSubscriber.new(params[:pre_launch_subscriber])

    if @pre_launch_subscriber.save!
      redirect_to subscribed_pre_launch_subscribers_path
    else
      render :index
    end
  end

  def subscribed; end
end

