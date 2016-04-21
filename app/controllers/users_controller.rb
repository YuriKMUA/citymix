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
    @user = User.new(user_params)
    @user.admin = user_params

    respond_to do |format|
      if @user.save
         sign_in @user
#         UserMailer.welcome_email(@user).deliver

         format.html { render "orders/info_orders" }
 #        format.json { render json: @user, status: :created, location: @user }
         flash.now[:success] = "Ваш личный кабинет создан успешно!"
      else
         format.html { render action: 'new' }
         flash.now[:danger] = "Ваш личный кабинет не создан! Не заполены или неверно заполнены необходимые поля."

      end
    end  
  end
  

  def search
      @user = User.find_by(email: params[:email]) 
       unless @user.nil? 
         flash.now[:success] = "Спасибо за Ваше сотрудничество с нами. Вы уже зарегистрированы, ввойдите, пожалуйста, в свой кабинет."
          sign_in @user
          render "orders/info_orders"
      else	
         redirect_to new_user_path
      end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Обновление прошло успешно!"
      sign_in @user 
      redirect_to @user
    else
      render 'edit'
    end
  end

  def change_pass
     @user = User.find_by(email: params[:email])
        if @user
            @user.password = "Zxcvbn"
            @user.password_confirmation = @user.password
            if @user.save
                UserMailer.send_pass(@user).deliver
                flash.now[:success] = "Пароль изменен"
                render  action: "change_pass"   
            end
        else     
            flash.now[:danger] = "Не верно введен електронный адресс"
            render "send_pass"
        end    
  end  
  
  def call_back
  end 

  def send_call_back
    @user = User.find_by(admin: true)
    @phone = params[:phone]
    @name = params[:name]
    @mail = []
    @mail[0] = params[:phone]
    @mail[1] = params[:name]
    @url = "citymix.com.ua"
    UserMailer.send_call_back(@mail).deliver
    flash[:info] = "Запрос об обратной связи направлен менеджерам сайта citymix.com.ua. В ближайшее время ожидайте звонка."
    redirect_to root_path
  end
 
  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def user_params
        params.require(:user).permit(:name, :city, :last_name, :email, :phone,
                                    :password, :password_confirmation, :adress)
    end
end  
