class UserMailer < ApplicationMailer
  default from: "contact@pirx-on-rails.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
    to: 'spam@mylu.de',
    subject: "A new contact form message from #{name}")
  end

  def welcome_mail
    @user = params[:user]
    @url  = 'https://pirx-on-rails.herokuapp.com/login'
    mail(from: 'welcome@pirx-on-rails.com',
    to: @user.email,
    subject: 'Welcome to Pirx-on-Rails!')
  end
  
end
