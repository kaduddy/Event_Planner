class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.valid? == false
      flash[:invalid] = "Invalid"
      flash[:errors] = @user.errors.full_messages
      redirect_to '/sessions/new'
    else
      session[:user_id] = @user.id
      redirect_to "/events/index"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to "/events/index"
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:f_name, :l_name, :email, :city, :state, :password, :password_confirmation)
    end
end
