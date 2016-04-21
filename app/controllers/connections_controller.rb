class ConnectionsController < ApplicationController
  def new
   @connection = $product.connections.new
  end

  def create
   @connection = $product.connections.new(connection_params)
#   @connection.product_id = $product.id
   @connection.cartikul = $product.cartikul + "-" + params[:connection][:color_id].to_s
   if @connection.save
      flash[:success] = " Данные по цвету присоединены к товару"
      $connection = @connection
      redirect_to new_connectionsize_path
   else
      flash[:danger] = "Не внесены обязательные для заполнения поля"
      redirect_to  new_connection_path
   end
  end

  def edit
      @connection = Connection.find(params[:id])
      @additional_photos = @connection.additional_photos
  end

  def update
      @connection = Connection.find(params[:id])
      @connection.cartikul = params[:connection][:cartikul]
      if params[:connection][:number].empty?
        @connection.number = 0
      else
        @connection.number = params[:connection][:number]
      end
      @connection.color_id = params[:connection][:color] unless params[:connection][:color].to_i == 0
      @connection.avatar = params[:connection][:avatar] unless params[:connection][:avatar].nil?
      @connection.content = params[:connection][:content] unless params[:connection][:content].nil?
      if @connection.update_attributes(connection_params)
         flash[:success] = 'Изменения сохранены'
         redirect_to edit_product_path($product.id)
      else
         flash.now[:danger] = 'Не сохранено. Не внесены обязательные поля'
         render "edit"
      end
  end

  def destroy
     Connection.find(params[:id]).destroy
     flash[:success] = "Удалено"
     redirect_to  edit_product_path($product.id)
  end

  private

    def connection_params
        params.require(:connection).permit(:avatar, :number, :cartikul, :color_id, :content, :product_id)
    end
 
end
