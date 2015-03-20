class AdditionalPhotosController < ApplicationController
   
  def index
  end 

  def new
    @additional_photo = AdditionalPhoto.new
  end

  def create
    @additional_photo = AdditionalPhoto.new(params[:additional_photo])
    @additional_photo.connection_id = $connection.id
    if @additional_photo.save
        flash.now[:success] = "Дополнительное фото внесено"
#        @current_product = $product
        redirect_to edit_product_path(@connection.id)
    else
        flash.now[:danger] = "Не выбраны обязательные поля"
        render "new"
    end
  end

  def show
     check_type
     check_kategory
     check_group_tov
     filter
     filter
     @current_product = Product.find($connection.product_id)
     @additional_photos = $connection.additional_photos
     @show_photo = $connection
     @show_add_photo = AdditionalPhoto.find(params[:id])
     render "products/show" 
  end

  def destroy
    AdditionalPhoto.find(params[:id]).destroy
    flash[:success] = "Удалено"
    redirect_to edit_product_path($product.id)
  end

  def edit
  end
end
