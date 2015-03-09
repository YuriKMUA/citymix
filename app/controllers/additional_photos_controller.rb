class AdditionalPhotosController < ApplicationController
   
  def index
  end 

  def new
    @additional_photo = AdditionalPhoto.new
  end

  def create
    @additional_photo = AdditionalPhoto.new(params[:additional_photo])
    @additional_photo.product_id = $product.id
    if @additional_photo.save
        flash.now[:success] = "Дополнительное фото внесено"
        @current_product = $product
        redirect_to edit_product_path(@current_product.id)
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
     @current_product = Product.find($product.product_id)
     @additional_photos = @current_product.additional_photos
     @show_photo = AdditionalPhoto.find(params[:id])
#     $filter_value[13] = params[:id]
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
