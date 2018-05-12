class UserMailer < ApplicationMailer
  default from: "contact@pirx-on-rails.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'spam@mylu.de',
         subject: "A new contact form message from #{name}")
  end
end
