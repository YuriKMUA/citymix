class UserMailer < ActionMailer::Base
  default from: "bydua@mail.ru"

  def welcome_email(user)
   @user = user
   @url = 'http://example.com/login'
   mail(to: @user.email, subject: 'Приглашение на сайт glos.km.com.ua')
  end

  def send_pass(user) 
     @user = user
     @url = "glos.km.com.ua"
     @pass = "Zxcvbn"
     mail(to: @user.email, subject: "Сброс пароля")
  end

end
