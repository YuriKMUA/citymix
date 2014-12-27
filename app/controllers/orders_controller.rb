class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
      @order = Order.new(ccontent: params[:message], dostavka: params[:delivery], oplata: params[:payment], nsum: $sum_in_basket, user_id: current_user.id, status_delivery_id: 1)    
      @order.save
      Basket.where(user_id: current_user.id, order_id: nil).each do |f|
          f.order_id = @order.id 
          f.save
      end
  end

  def update
      @order = Order.find(params[:order] [:id])
      if @order.update_attributes(params[:order])
         unless @order.declaration_id.empty?
            @order.status_delivery_id = 6
            @order.save
         end
         flash.now[:success] = "Изменения внесены успешно"
         redirect_to user_path(@order.user_id)
      end   
  end

  def info_orders
      @user = User.new
  end 
end
