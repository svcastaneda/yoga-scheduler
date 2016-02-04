class UsersController < ApplicationController
  protect_from_forgery
  
  def index
  end
  
  def new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render template: 'users/new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
