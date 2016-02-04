class SessionsController < ApplicationController
  def new
    render template: 'sessions/login'
  end
  
  def create
    @user = User.find_by(email: login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = ['WRONG CREDENTIALS']
      render template: 'sessions/login'
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
  
  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
