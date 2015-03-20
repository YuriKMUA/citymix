class ProductsController < ApplicationController


  def new
   @product = Product.new
   @connection = @product.connections.build
   @connectionsize = Connectionsize.new
  end

  def create
      @product = Product.new(product_params)
      @product.kategories_id = @@kategory_id
      @product.group_tov_id = @@group_tov_id
      @product.type_id = @@type_id
      if params[:avatar] 
         @product.avatar = params[:avatar] 
      else
         @product.avatar = params[:avatar] 
      end
      @product.llatest = true
      @product.avatar.url
      @product.avatar.current_path
      @product.avatar.identifier
      if  @product.save 
        flash[:success] = "Товар внесен в базу данных!"
        $product = @product
      redirect_to new_connection_path  
      else
         flash[:danger] = "Данные не сохранены. Не заполнены обязательные поля, отмеченые звездочкой"
         render "new"
      end
#   render inline: " <%= @product.group_tov_id %> <%= @product.nprice %>"

  end

  def index
  end

  def edit
    @current_product = Product.find(params[:id]) 
    @connections = @current_product.connections
    params[:ids] = params[:id] if params[:ids].nil? 
    if  params[:ids].to_i <= Product.last.id
        @current_product = Product.find(params[:ids])  
        $product = @current_product
        if @current_product.nil?
            @current_product = Product.find(Product.first.id)
        end 
            @connections = @current_product.connections
            @connections = [] if @connections.nil?
#            @additional_photos = @current_product.additional_photos
	    if @connectionsizes.nil?
		    @connectionsizes = [] 
	    else
		    @connectionsizes = @connections.connectionsizes
	    end
    else
        flash.now[:danger] = "Не верно введен код. Диапазон ввода #{Product.first.id} - #{Product.last.id}"
    end
   
  end

  def update
       @current_product = Product.find(params[:id])
       
       @current_product.llatest = params[:product][:llatest] unless  params[:product][:llatest].to_s == true
       @current_product.lvisible = params[:product][:lvisible] unless  params[:product][:lvisible].to_s == true
       @current_product.kategories_id = params[:product][:kategories_id] unless params[:product][:kategories_id].to_i == 0
       @current_product.group_tov_id = params[:product][:group_tov_id] unless  params[:product][:group_tov_id].to_i == 1
       @current_product.season_id = params[:product][:season_id] unless  params[:product][:season_id].to_i == 1
       @current_product.condition_id = params[:product][:condition_id] unless  params[:product][:condition_id].to_i == 1
       @current_product.type_id = params[:product][:type_id] unless  params[:product][:type_id].to_i == 0
       @current_product.brand_id = params[:product][:brand_id] unless  params[:product][:brand_id].to_i == 0
       @current_product.availability = params[:product][:availability] unless  params[:product][:availability] == "в наличии"
       @current_product.manufacturer_id = params[:product][:manufacturer_id] unless  params[:product][:manufacturer_id].to_i == 0 
       @current_product.nprice = params[:product][:nprice] 
       @current_product.nold_price = params[:product][:nold_price] 
       @current_product.npurchase_price = params[:product][:npurchase_price]
       @current_product.ctxt = params[:product][:ctxt] 
       @current_product.ccontent = params[:product][:ccontent] 
  
    if @current_product.save
       flash[:success] = "Обновление прошло успешно"
       redirect_to edit_product_path(@current_product)
    else
       render "edit"
    end
  end

  def show
     if $filter_value == nil
       $filter_value = []
       $filter_value[0] = 1
       $filter_value[1] = 0
     end   
    $filter_value[9] = nil 
    $connection = Connection.find(params[:id]) 
    @show_photo = $connection
    @show_color = @show_photo
    @current_product = Product.find($connection.product_id)
    @additional_photos = @show_color.additional_photos
    $filter_value[13] = params[:id]
   
    check_type  
    check_kategory
    check_group_tov
    filter

  end
  
  def destroy
     Product.find(params[:id]).destroy
     flash[:success] = "Удалено"
     redirect_to  root_path

  end
  def search
    if params[:price_min].nil? || params[:price_max].nil?
          $filter_value[11] = 0
          $filter_value[12] = 99000
   else
          $filter_value[11] = params[:price_min].to_i
          $filter_value[12] = params[:price_max].to_i
   end
   $filter_value[3] = params[:brand].to_i unless params[:brand] == nil
   $filter_value[4] = params[:season].to_i unless params[:season] == nil
   $filter_value[5] = params[:manufacturer].to_i unless params[:manufacturer] == nil
   if params[:page_per].nil?   
      $filter_value[8] = 24
   else 
      $filter_value[8] = params[:page_per].to_i 
   end   
   # Color
   @filter_col = []
   n = 0
   last_r = Color.last
   (1..last_r.id).each do |f|
      @idc = "idc" + f.to_s
      if params[@idc].to_i == f
         @filter_col[n] = params[@idc]
         n += 1
      end      
   end
   $filter_value[6] = @filter_col if n > 0
   # end color
   # Size
   @filter_size = []
   n = 0
   last_r = Size.last
   (1..last_r.id).each do |f|
      @ids = "ids" + f.to_s
      if params[@ids].to_i == f
         @filter_size[n] = params[@ids]
         n += 1
      end      
   end
   $filter_value[9] = @filter_size if n > 0
   # end Size
     $goods = Product.joins(:colors, :sizes).where(brand_id: $filter_value[3], season_id: $filter_value[4], colors: { id: $filter_value[6] }, sizes: { id: $filter_value[9] }, nprice: ($filter_value[11]..$filter_value[12]), kategories_id: $filter_value[1], group_tov_id: $filter_value[0]).uniq.paginate(page: params[:page], per_page: $filter_value[8].to_i)   
     $goods = Product.order("nprice").joins(:colors, :sizes).where(brand_id: $filter_value[3], season_id: $filter_value[4], colors: { id: $filter_value[6] }, sizes: { id: $filter_value[9] }, nprice: ($filter_value[11]..$filter_value[12]), kategories_id: $filter_value[1], group_tov_id: $filter_value[0]).uniq.paginate(page: params[:page], per_page: $filter_value[8].to_i) if params[:btn_up]

     $goods = Product.order("nprice DESC").joins(:colors, :sizes).where(brand_id: $filter_value[3], season_id: $filter_value[4], colors: { id: $filter_value[6] }, sizes: { id: $filter_value[9] }, nprice: ($filter_value[11]..$filter_value[12]), kategories_id: $filter_value[1], group_tov_id: $filter_value[0]).uniq.paginate(page: params[:page], per_page: $filter_value[8].to_i) if params[:btn_down]   
     
    $goods = Product.order("nprice").joins(:colors, :sizes).where(llatest: true, kategories_id: $filter_value[1], group_tov_id: $filter_value[0]).uniq.paginate(page: params[:page], per_page: $filter_value[8].to_i) if params[:btn_new]
   if $goods.empty?     
          flash.now[:danger] = "По заданному фильтру товаров не найдено "  
          $goods = Product.where(kategories_id: $filter_value[1], group_tov_id: $filter_value[0])
   end       
#          efilter_value[7] = nil
#          $filter_value[2] = nil
          $filter_value[3] = nil
          $filter_value[4] = nil
#          $filter_value[5] = nil
          $filter_value[6] = nil
#          $filter_value[8] = nil
          $filter_value[9] = nil
          $filter_value[11] = 0
          $filter_value[12] = 99000

  
      check_type
      check_kategory
      check_group_tov
      filter

#  render inline: "Вывод <%= $filter_value[2].to_s + $filter_value[3].to_s + $filter_value[4].to_s + $filter_value[5].to_s + $filter_value[6].to_s + $filter_value[9].to_s + $filter_value[11].to_s + $filter_value[12].to_s %>"
#   render inline: "<%= $filter_value %>"
  render  "group_tovs/show" 
  end

  def cancel
      $goods = Connection.joins(:product).where(products: {group_tov_id: $filter_value[0], kategories_id: $filter_value[1] }).all
#     $goods = Product.where(kategories_id: $filter_value[1], group_tov_id: $filter_value[0])
     @empty = "Все"
     $filter_value[2] = nil
     $filter_value[3] = nil
     $filter_value[4] = nil
     $filter_value[5] = nil
     $filter_value[6] = nil
     $filter_value[8] = nil
     $filter_value[9] = nil
     $filter_value[11] = 0
     $filter_value[12] =99000

     $filter_value[14] = @empty
     $filter_value[15] = @empty
     $filter_value[16] = @empty
     check_type
     check_kategory
     check_group_tov
     filter
#    render inline: "<%= $filter_value[1] %>"
     render "group_tovs/show" 
  end

  def locate
      product = Connection.find_by_cartikul(params[:artikul]) 
       unless product.nil? 
#         flash.now[:success] = "Спасибо за Ваше сотрудничество с нами. Вы уже зарегистрированы, ввойдите, пожалуйста, в свой кабинет."
         check_in(product) 
         redirect_to product_path(product.id)
      else	
         flash[:danger] = "Товара с данным артикулом не найдено"
         redirect_to root_url
      end
  end
  
  def flt_by_group_tov
      @group_tovs_array = GroupTov.where(id: params[:group_tov_id]).map { |group_tov| [group_tov.ctxt, group_tov.id] } 
      @@group_tov_id = params[:group_tov_id]
      @kategories_array = Kategory.order("ctxt_ua").where(group_tov_id: params[:group_tov_id]).map { |kategory| [kategory.ctxt_ua, kategory.id] }  
      @product = Product.new 
      @connection = @product.connections.build
      @connectionsize = Connection.new
       render "new"
  end

  def flt_by_kategory
#      @group_tovs_array = GroupTov.where(id: params[:ngroup_tov_id]).map { |group_tov| [group_tov.ctxt, group_tov.id] } 
      @kategories_array = Kategory.order("ctxt_ua").where(id: params[:kategories_id]).map { |kategory| [kategory.ctxt_ua, kategory.id] }  
      @@kategory_id = params[:kategories_id]
      @brands_array = Brand.where(kategories_id: params[:kategories_id]).map { |brand| [brand.ctxt, brand.id] } 
      @types_array = Type.where(kategories_id: params[:kategories_id]).map { |brand| [brand.ctxt, brand.id] } 
      @@type_id = params[:type_id]
      @product = Product.new
      @connection = @product.connections.build
      @connectionsize = Connection.new
      render "new"
  end
  
  def sbros_flt
      @group_tovs_array = GroupTov.all.map { |group_tov| [group_tov.ctxt, group_tov.id] } 
      @kategories_array = Kategory.all.map { |kategory| [kategory.ctxt_rus + ' ' + kategory.ctxt_ua, kategory.id] }  
      @brands_array = Brand.all.map { |brand| [brand.ctxt, brand.id] } 
      @types_array = Type.all.map { |type| [type.ctxt, type.id] }
      @product = Product.new
      @connection = @product.connections.build
      @connectionsize = Connection.new
      render "new"
   end

private

   def product_params
      params.require(:product).permit(:ctxt, :type_id, :avatar, :nprice, :nold_price, :cartikul, :kategories_id, :brand_id, :season_id, :manufacturer_id, :neck_id, :fastener_id, :llatest, :created_at, :group_tov_id, :ccontent, :condition_id, :availability, :npurchase_price, connections_attributes: [:number, :color_id, :avatar, :content])
   end
end

