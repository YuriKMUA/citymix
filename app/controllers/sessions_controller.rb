#encoding: utf-8
class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session] [:email].downcase)
    if user && user.authenticate(params[:session] [:password])
      sign_in user
       @baskets = Basket.where(user_id: current_user.id, order_id: nil).count
      if @baskets > 0
         redirect_to info_orders_path
      else
          redirect_back_or user
#         redirect_to user_path(current_user.id)
      end
    else
      flash.now[:danger] = "Не верно введен електронный адрес или пароль"
      render 'new'
    end
 end

  def destroy
     Basket.where(user_id: current_user.id).each do |f|
            f.remember_token = current_user.remember_token
            f.save
     end
    sign_out
    redirect_to root_url
  end

end
