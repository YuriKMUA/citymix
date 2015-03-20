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
      unless $filter_value[9].nil?  
         @basket = Basket.new(user_id: id_of_user, cartikul: $connection.cartikul, ctxt: $product.ctxt, size_id: $filter_value[9], number: 1, nprice: $product.nprice,
         nsum: $product.nprice, color_id: $connection.color_id , avatar: $connection.avatar, remember_token: remember_token, status_delivery_id: 3)
        if @basket.save
            check_type
            check_kategory
            check_group_tov
            filter
            redirect_to baskets_path
        else
            flash[:danger] = "Не записано. Не заполнены необходимые поля"
        end
     else
        flash[:warning] = "Не выбрано размер. Сделайте выбор размера и нажимите кнопку 'КУПИТЬ'"
         check_type
        check_kategory
        check_group_tov
        filter
        redirect_to product_path($filter_value[13])
     end
  end

  def show_photo_color
     check_type
     check_kategory
     check_group_tov
     filter
     @show_photo = Connection.find(params[:id])
     @show_color = @show_photo
     @current_product = Product.find($connection.product_id)
     @additional_photos = @show_photo.additional_photos
     $filter_value[13] = params[:id]
     render "products/show" 
  end
    
  def chooze_size
     check_type
     check_kategory
     check_group_tov
     filter
     @show_photo = Connection.find($filter_value[13].to_i)
     @show_color = @show_photo
     @chooze_size = Connectionsize.find(params[:id])
     @current_product = Product.find($connection.product_id)
     @additional_photos = @show_photo.additional_photos
     $filter_value[9] = @chooze_size.size_id
     @status = ""
     render "products/show"
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
