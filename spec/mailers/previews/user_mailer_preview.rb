# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  
  def contact_form
    UserMailer.contact_form("jane@example.com", "Jane", "Hello Pirx!")
  end

  def welcome_mail
    UserMailer.with(user: User.first).welcome_mail
  end

end
