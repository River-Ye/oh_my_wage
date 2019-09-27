class WagemailMailer < ApplicationMailer
  default from: "http://localhost:3000"
  def say_hello_to(user)
    @user = user
    mail to:@user.email, subject:"HI"
  end

  def password_reset(user, token) 
    @resource = user 
    @token = token 
    mail(:to => user.email, 
         :subject => 'Password Reset Notification') 
end
end
