class KategoriesController < ApplicationController
  def index
    @kategories = Kategory.paginate(page: params[:page])
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
         redirect_to new_product_path
      else
         flash.now[:danger] = "Не сохранено. Не внесены данные, отмеченные звездочкой"
         render "new"
      end
  end

  def show
  end

  def edit
    @kategory = Kategory.find(params[:id])
  end 

  def update
    @kategory = Kategory.find(params[:id])
    @kategory.group_tov_id = params[:kategory][:group_tov_id] unless params[:kategory][:group_tov_id] == 0
    @kategory.lvisible = params[:kategory][:lvisible] unless params[:kategory][:lvisible] == "--"
    @kategory.ctxt_ua = params[:kategory][:ctxt_ua]
    @kategory.avatar =  params[:kategory][:avatar] unless params[:kategory][:avatar].nil?
    @kategory.ctxt_rus = "Мужские" if @kategory.group_tov_id == 1 || @kategory.group_tov_id == 4 
    @kategory.ctxt_rus = "Женские" if @kategory.group_tov_id == 2
    @kategory.ctxt_rus = "Детские" if @kategory.group_tov_id == 3

    if @kategory.save 
      flash[:success] = "Обновление прошло успешно!"
      redirect_to root_path
    end
  end

  def destroy
    Kategory.find(params[:id]).destroy
    flash[:success] = "Удалено"
    redirect_to kategories_url
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
