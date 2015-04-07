class UserMailer < ActionMailer::Base
  default from: "manager@citymix.com.ua"

  def welcome_email(user)
   @user = user
   @url = 'http://citymix.com.ua'
   mail(to: @user.email, subject: 'Приглашение на сайт citymix.com.ua')
  end

  def send_pass(user) 
     @user = user
     @url = "citymix.com.ua"
     @pass = "Zxcvbn"
     mail(to: @user.email, subject: "Сброс пароля")
  end

    def send_call_back(mail)
     @user = User.find_by_admin(true)
     @url = "citymix.com.ua"
     @phone = mail[0]
     @name = mail[1]
     mail(to: @user.email, subject: "Заказ на обратный звонок #{@phone}")
  end


end
