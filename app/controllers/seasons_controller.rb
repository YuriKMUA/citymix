class SeasonsController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def delete
  end

  def edit
  end

  def products
#     @goods = TemporaryProduct.where(nseason_id: params[:id])
     $filter_value[4] =  params[:id]   
     $filter_value[15] = Season.find(params[:id]).ctxt

     check_type
     check_kategory
     check_group_tov
     filter
     render "group_tovs/show"
  end
end

