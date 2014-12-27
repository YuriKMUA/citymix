class NecksController < ApplicationController
  def products
#     @goods = TemporaryProduct.where(neck_id: params[:id])
     $filter_value[8] =  params[:id]    
     $filter_value[7] = Neck.find(params[:id]).ctxt

#     check_type
#     check_kategory
#     check_group_tov
#     filter
#     render "group_tovs/show"
 
  end
end
