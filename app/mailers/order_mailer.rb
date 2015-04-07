class OrderMailer < ActionMailer::Base
  default from: "manager@citymix.com.ua"

  def welcome_email(user)
   @user = user
   @url = 'http://citymix.com.ua'
   mail(to: @user.email, subject: 'Приглашение на сайт citymix.com.ua')
  end

  def send_mail(order)
     @user = User.find_by_admin(true)
     @order = order
     @url = "citymix.com.ua"
     mail(to: @user.email, subject: "Новый заказ № #{@order.id}")
  end

 
end
