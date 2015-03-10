class TypesController < ApplicationController
  def new
      @type = Type.new
  end

  def create
      @type = Type.new(params[:type])
      if @type.save
         flash.now[:success] = "Сохранено"
         redirect_to new_product_path
      else
         flash.now[:danger] = "Не сохранено. Не внесены данные, отмеченные звездочкой"
         redirect_to new_product_path
      end
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
       
#       @goods = TemporaryProduct.where(type_id: params[:id]).all      
       $filter_value[2] = [params[:id]]
       $filter_value[7] = "#{$filter_value[7]}" + Type.find(params[:id]).ctxt
       check_type
       check_kategory
       check_group_tov
       filter
       render "group_tovs/show"
  end

end
