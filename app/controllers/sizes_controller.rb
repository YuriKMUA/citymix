class SizesController < ApplicationController
   def products
#       @goods = Size.find(params[:id]).temporary_products.all
       $filter_value[9] = params[:id]
       $filter_value[7] = Size.find(params[:id]).ctxt
#       check_type
#       check_kategory
#       check_group_tov
#       filter
#       render "group_tovs/show"

   end
end
