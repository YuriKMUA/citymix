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
   
end
