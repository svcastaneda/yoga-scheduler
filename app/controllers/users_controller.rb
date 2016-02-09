class UsersController < ApplicationController
  protect_from_forgery

  def index
  end

  def new
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user && @user == current_user
      render template: 'users/edit'
    else
      redirect_to '/500'
    end
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_classes_path(@user)
    else
      @errors = @user.errors.full_messages
      render template: 'users/edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # UserMailer.welcome_email(@user).deliver_later
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render template: 'users/new'
    end
  end

  def show
    if current_user
      user = User.find_by(id: params[:id])
      if user == current_user
        render template: 'users/show'
      else
        redirect_to '/500'
      end
    else
      redirect_to '/login'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
