class ConnectionsController < ApplicationController
  def new
   @connection = $product.connections.build
  end

  def create
   @connection = $product.connections.build(params[:connection])
#   @connection.product_id = $product.id
   @connection.cartikul = $product.cartikul + "-" + params[:connection][:color_id].to_s
   if @connection.save
      flash[:success] = " Данные по цвету присоединены к товару"
      $connection = @connection
   else   
      flash[:danger] = "Не внесены обязательные для заполнения поля"
   end   
#     redirect_to  edit_product_path($product.id)
   redirect_to new_connectionsize_path
  end

  def edit
      @connection = Connection.find(params[:id])
  end

  def update
      @connection = Connection.find(params[:id])
      @connection.color_id = params[:connection][:color] unless params[:connection][:color].to_i == 0
#      @connection.size_id = params[:connection][:size] unless params[:connection][:size].to_i == 0
      @connection.avatar = params[:connection][:avatar] unless params[:connection][:avatar].nil?
      
      if @connection.save
         flash[:success] = 'Изменения сохранены'
      end
      redirect_to edit_product_path($product.id)
  end

  def destroy
     Connection.find(params[:id]).destroy
     flash[:success] = "Удалено"
     redirect_to  edit_product_path($product.id)
  end
end
