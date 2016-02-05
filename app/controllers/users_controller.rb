class UsersController < ApplicationController
  protect_from_forgery
  
  def index
  end
  
  def new
  end
  
  def edit
    p params
    # current_user.update_attributes(params[:user])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render template: 'users/new'
    end
  end
  
  def show
    user = User.find_by(id: params[:id])
    if user == current_user
      render template: 'users/show'
    else
      redirect_to '/500'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
  
  def current_user
    User.find_by(id: session[:user_id])
  end
end
