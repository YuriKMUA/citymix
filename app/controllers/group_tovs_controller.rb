class GroupTovsController < ApplicationController
  def new
  end

  def show
       $filter_value = []
       $filter_value[1] = 0
       $filter_value[8] = 24
       if current_user && current_user.admin?
           $goods = Connection.joins(:product).where(products: { group_tov_id: params[:id], kategory_id: params[:kategory_id], lvisible: [true, false] })
       else
           $goods = Connection.joins(:product).where(products: { group_tov_id: params[:id], kategory_id: params[:kategory_id], lvisible: true })
       end
       $filter_value = [ params[:id], params[:kategory_id] ]
          check_type
          check_kategory
          check_group_tov
          filter
         
  end       

  def edit
  end

  def update
  end

  def delete
  end

  def create
  end


end
