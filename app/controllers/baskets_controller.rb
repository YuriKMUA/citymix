class BasketsController < ApplicationController

  def index
      if signed_in?
         @baskets = Basket.where(user_id: current_user.id, order_id: nil)
      else
         unless cookies[:remember_token].nil?
            @baskets = Basket.where(remember_token: cookies[:remember_token])
         end   
      end
  end

  def new
 
  end

  def create
   if signed_in?
      remember_token = current_user.remember_token
      id_of_user = current_user.id
   else
      id_of_user = nil
      if cookies[:remember_token].nil?
         create_remember_token
      end
         remember_token = cookies[:remember_token]
    end
   n = 0
   $product.connections.each do |f|

      @check = "check" + f.id.to_s
      if params[@check].to_i == f.id
         n += 1
         @num = "num" + f.id.to_s
         @size = "size" + f.id.to_s
         unless  $product.nprice == nil  
            sum = $product.nprice.to_i * params[@num].to_i
         else
            sum = 0
         end
         @basket = Basket.new(user_id: id_of_user, cartikul: $product.cartikul, ctxt: $product.ctxt, size_id: params[@size], number: params[@num], nprice: $product.nprice, nsum: sum, color_id: f.color_id , avatar: f.avatar, remember_token: remember_token, status_delivery_id: 3)
         @basket.save
      end
   end
   if n > 0
      redirect_to baskets_path
   else
      flash.now[:danger] = "Не выбрано ни одного товара. Поставьте отметку в графе 'В корзину' и повторно нажмите кнопку 'КУПИТЬ'"
      check_type
      check_kategory
      check_group_tov
      filter
      render "products/show"
   end
  end

  def change_numbers
      if signed_in?
        @baskets = Basket.where(user_id: current_user.id, order_id: nil)
      else
        @baskets = Basket.where(remember_token: cookies[:remember_token])
      end
      @baskets.each do |f|
         @kol = "kol" + f.id.to_s
         f.number = params[@kol]
         f.nsum = f.nprice * params[@kol].to_i
         f.save
      end
      render "index"
  end

  def show
      @baskets = Basket.where(order_id: params[:id])
      @kod_order = params[:id]
  end

  def destroy
      Basket.find(params[:id]).destroy
      if Basket.any?
         redirect_to baskets_path
      else   
            flash.now[:info] = "Ваша корзина пуста. " 
         check_type
         check_kategory
         check_group_tov
         filter
         render "group_tovs/show"
      end
   end

   def del_basket_all
      Basket.delete_all
      flash.now[:info] = "Ваша корзина пуста. Ваш выбор, господа! " 
      redirect_to root_path
   end
   
   def edit
      @basket = Basket.find(params[:id])
   end
  
   def update
    @basket = Basket.find(params[:id])
    if @basket.update_attributes(params[:basket])
      flash[:success] = "Обновлений прошло успешно!"
         @basket.status_delivery_id = params[:status]
         @basket.save
      else
         flash.now[:danger] = "Поиск неудачный "
      end
       redirect_to basket_path(@basket.order_id)
   end

   
   private

      def create_remember_token
       remember_token = SecureRandom.urlsafe_base64
        cookies.permanent[:remember_token] = remember_token
      end
  
end
