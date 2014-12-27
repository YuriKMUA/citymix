class ManufacturersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def create
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

