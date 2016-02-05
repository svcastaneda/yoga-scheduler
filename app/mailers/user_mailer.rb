class UserMailer < ApplicationMailer
  default from: 'ddiaz914@gmail.com'

  def welcome_email(user)
    attachments.inline['dgc-yoga-logo'] = { content: File.read("#{Rails.root}/app/assets/images/dbc-yoga-logo.png"),
                           mime_type: "image/png" }
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to DBC Yoga :D')
  end

  def signup_email(user)
    attachments.inline['dgc-yoga-logo'] = { content: File.read("#{Rails.root}/app/assets/images/dbc-yoga-logo.png"),
                           mime_type: "image/png" }
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to DBC Yoga :D')
  end

end
