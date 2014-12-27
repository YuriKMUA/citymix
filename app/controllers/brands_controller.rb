class BrandsController < ApplicationController

  def products
#       @goods = TemporaryProduct.where(nbrand_id: params[:id]).all      
       $filter_value[3] = params[:id]
       $filter_value[14] = Brand.find(params[:id]).ctxt

       check_type
       check_kategory
       check_group_tov
       filter
       render "group_tovs/show"
  end

  def new
   @brand = Brand.new
  end

  def create
      @brand = Brand.new(params[:brand])
      if @brand.save
         flash.now[:success] = "Сохранено"
         redirect_to new_product_path
      else
         flash.now[:danger] = "Не сохранено. Не внесены данные, отмеченные звездочкой"
         render "new"
      end

  end
end

