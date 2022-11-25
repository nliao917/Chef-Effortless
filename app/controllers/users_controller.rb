class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def login
  end

  def signup
  end


  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Error - please try to create an account again."
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end