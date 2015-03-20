class UserMailer < ActionMailer::Base
  default from: "yurikmua@gmail.com"

  def welcome_email(user)
   @user = user
   @url = 'http://example.com/login'
   mail(to: @user.email, subject: 'Приглашение на сайт citymix.com.ua')
  end

  def send_pass(user) 
     @user = user
     @url = "citymix.com.ua"
     @pass = "Zxcvbn"
     mail(to: @user.email, subject: "Сброс пароля")
  end

end
