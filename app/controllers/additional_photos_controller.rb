class AdditionalPhotosController < ApplicationController
   
  def index
  end 

  def new
  end

  def create
  end

  def show
     check_type
     check_kategory
     check_group_tov
     filter
     @show_photo = AdditionalPhoto.find(params[:id])
#     $filter_value[13] = params[:id]
     render "products/show" 
  end

  def destroy
  end

  def edit
  end
end
