class UserMailer < ApplicationMailer
  default from: 'ddiaz914@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://dbcyoga.com/login'
    mail(to: @user.email, subject: 'Welcome to DBC Yoga :D')
  end
end
