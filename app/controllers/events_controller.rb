class EventsController < ApplicationController
  require 'date' 

  def index
    @user = User.find(session[:user_id])
    @events = Event.where(state: @user.state)
    @others = Event.where.not(state: @user.state)
  end

  def new
  end

  def create
    @user = User.find(session[:user_id])
    @event = Event.create(name: params[:name], city: params[:city], state: params[:state], date: params[:date], user: @user)
    # render json: @event.date 
    if @event.valid? == false
         if @event.date < Date.today()
          flash[:error] = "Date has already occurred"
         end 
      flash[:incorrect] = @event.errors.full_messages
      redirect_to "/events/index"
    else
      redirect_to "/events/index"
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find_by(id: session[:user_id])
    puts "XXXXXXXXXX"
    puts @user
    @discussions = Discussion.where(event_id: params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(name: params[:name], city: params[:city], state: params[:state], date: params[:date])
    redirect_to "/events/index"
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to "/events/index"
  end

  private
  def event_params
    params.require(:event).permit(:name, :city, :state, :date)
  end
end
