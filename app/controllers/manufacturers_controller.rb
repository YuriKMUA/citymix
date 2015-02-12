class ManufacturersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
     @manufacturer = Manufacturer.new   
  end 

  def create
     @manufacturer = Manufacturer.new(params[:manufacturer])
      if @manufacturer.save
         flash.now[:success] = "Сохранено"
         redirect_to new_product_path
      else
         flash.now[:danger] = "Не сохранено. Не внесены данные, отмеченные звездочкой"
         render "new"
      end
  end

  def products
     @goods = Product.where(nmanufacturer_id: params[:id])
     $filter_value[5] =  params[:id]    
     $filter_value[16] = Manufacturer.find(params[:id]).ctxt

     check_type
     check_kategory
     check_group_tov
     filter
     render "group_tovs/show"

  end
end

