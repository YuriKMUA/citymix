#encoding: utf-8
class UsersController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers, :search] 
before_filter :correct_user, only: [:edit, :update] 
before_filter :admin_user, only: :destroy


  def following
      @title = "Following"
      @user = User.find(params[:id])
      @users = @user.followed_users.paginate(page: params[:page])
      render 'show_follow'
  end

  def followers
      @title = "Followers"
      @user = User.find(params[:id])
      @users = @user.followers.paginate(page: params[:page])
      render 'show_follow'
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'Удалено'
    redirect_to users_url
  end

  def admin_user
    redirect_to(user_path) unless current_user.admin?
  end

  def new
    @user = User.new
 end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
         sign_in @user
         UserMailer.welcome_email(@user).deliver

         format.html { render "orders/info_orders" }
         format.json { render json: @user, status: :created, location: @user }
         flash.now[:success] = "Ваш личный кабинет создан успешно!"
      else
         format.html { render action: 'new' }
      end
    end  
  end
  
  def edit
  end

  def search
      @user = User.find_by_email(params[:email]) 
       unless @user.nil? 
         flash.now[:success] = "Спасибо за Ваше сотрудничество с нами. Вы уже зарегистрированы, ввойдите, пожалуйста, в свой кабинет."
          sign_in @user
          render "orders/info_orders"
      else	
         redirect_to new_user_path
      end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Обновление прошло успешно!"
      sign_in @user 
      redirect_to @user
    else
      render 'edit'
    end
  end

  def send_pass
     @user = User.find_by_email(params[:email])
        if @user
            @user.password = "Zxcvbn"
            @user.password_confirmation = @pass
            @user.save
            UserMailer.send_pass(@user).deliver
            render  action: "change_pass"   
         end    
  end  

 
  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end  
