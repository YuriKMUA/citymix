class ConnectionsizesController < ApplicationController
  def new
      @connectionsize = Connectionsize.new
  end

  def create
      @connectionsize = Connectionsize.new(params[:connectionsize])
      @connectionsize.connection_id = $connection.id
      if @connectionsize.save
         flash[:success] = "Данные по размеру и количеству присоединены к товару"
      else   
         flash[:danger] = "Не внесены обязательные для заполнения поля"
      end   
   render "static_pages/vybor"

  end

  def edit
	@connectionsize = Connectionsize.find(params[:id])		
  end

  def update
	@connectionsize = Connectionsize.find(params[:id])		
    @connectionsize.size_id = params[:connectionsize][:size_id] unless params[:connectionsize][:size_id].to_i == 0
    @connectionsize.number = params[:connectionsize][:number] unless params[:connectionsize][:number].nil?
    if @connectionsize.save
       flash[:success] = "Данные по размеру и количеству присоединены к товару"
    end   
    redirect_to  edit_product_path($product.id)
  end

  def destroy
     Connectionsize.find(params[:id]).destroy
     flash[:success] = "Удалено"
     redirect_to  edit_product_path($product.id)
  end
end
