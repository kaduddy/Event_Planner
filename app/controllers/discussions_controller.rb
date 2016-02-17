class DiscussionsController < ApplicationController
  def create
  	@discussion = Discussion.create(discussion_params)
  	redirect_to "/events/#{@discussion.event_id}"
  end

  private
  def discussion_params
  	params.require(:discussion).permit(:text, :user_id, :event_id)
  end
end
