#encoding: utf-8
class StaticPagesController < ApplicationController

   def index
      if signed_in?
         @micropost = current_user.microposts.build
         @feed_items = current_user.feed.paginate(page: params[:page])
      end
   end

   def home
 #     @micropost = current_user.microposts.build  if signed_in?
   end

   def help
   end
  
   def about
   end

   def filter_group_kats
       $filter_value = []
       $filter_value[1] = 0
       $filter_value[8] = 24
       if signed_in? && current_user.admin?
           $goods = Connection.joins(:product).where(products: { group_tov_id: params[:group_tov_id], kategory_id: params[:id], lvisible: [true, false] })
       else
           $goods = Connection.joins(:product).where(products: { group_tov_id: params[:group_tov_id], kategory_id: params[:id], lvisible: true })
       end
       $filter_value = [params[:group_tov_id], params[:id]]
       check_type
       check_kategory
       check_group_tov
       filter
       render "products/show"   

   end
   
end
