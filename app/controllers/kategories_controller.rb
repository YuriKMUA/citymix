class KategoriesController < ApplicationController
  def index
  end

  def new 
      @kategory = Kategory.new
  end

  def create
      @kategory = Kategory.new(params[:kategory])
      @kategory.lvisible = true
      @kategory.ctxt_rus = "Мужские" if @kategory.group_tov_id == 1 || @kategory.group_tov_id == 4 
      @kategory.ctxt_rus = "Женские" if @kategory.group_tov_id == 2
      @kategory.ctxt_rus = "Детские" if @kategory.group_tov_id == 3

      if @kategory.save
         flash.now[:success] = "Сохранено"
#        redirect_to new_product_path
         render "products/new"
      else
         flash.now[:danger] = "Не сохранено. Не внесены данные, отмеченные звездочкой"
         render "new"
      end
  end

  def show
  end

  def update
  end

  def destroy
  end

   def show_for_menu
      
      @goods = Good.where(kategories_id: params[:id])
      if @goods == nil
         flash.now[:danger] = "Необхідних записів не знайдено"
       else
#         @cnt = @goods.count
         flash.now[:success] = "Знайдено "   # + @cnt.to_s
      end

   end
end
