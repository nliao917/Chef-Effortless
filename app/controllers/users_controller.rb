class UsersController < ApplicationController
  def index
  end

  def show
  end

  def signup
    @user = User.new
  end

  def login
  end

  # def signup
  # end

  def new
    @user = User.new
  end
  def signout
    reset_session
    flash[:notice] = "You have successfully signed out!"
    redirect_to root_path

  end

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      flash[:notice] = "Error - please try to create an account again."
      render :new
    end
  end


  def user_params
    params.require(:user).permit(:email,:password)
  end
end