class UserEventsController < ApplicationController
  def create
  	@event = Event.find(params[:event_id])
  	@user = User.find(params[:user_id])
  	@join = UserEvent.create(user_id: params[:user_id], event_id: params[:event_id])
  	redirect_to "/events/index"
  end

  def update
  end

  def destroy
    @participant = UserEvent.where(user_id: params[:user_id], event_id: params[:event_id])
    @participant[0].delete
    redirect_to "/events/index"
  end

end
