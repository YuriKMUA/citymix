class FastenersController < ApplicationController
  def products
#     @goods = TemporaryProduct.where(fastener_id: params[:id])
     $filter_value[10] =  params[:id]    
     $filter_value[7] = Fastener.find(params[:id]).ctxt

#     check_type
#     check_kategory
#     check_group_tov
#     filter
#     render "group_tovs/show"

  end
end
