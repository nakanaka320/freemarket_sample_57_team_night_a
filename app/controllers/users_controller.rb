class UsersController < ApplicationController
   def index
   end

   def login_new
   end

  def step1
    @user = User.new
  end

  def step1_save
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:first_name] = user_params[:first_name]
    session[:last_name] = user_params[:last_name]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:birthday_year] = user_params[:"birthday(1i)"]
    session[:birthday_month] = user_params[:"birthday(2i)"]
    session[:birthday] = user_params[:"birthday(3i)"]
    # binding.pry
    redirect_to step2_users_path
   end

   def step2
   @user = User.new 
   end

   def step2_save
    session[:phone_number] = user_params[:phone_number]
    # binding.pry
    redirect_to step3_users_path
   end

   def step3
    @user = User.new
   end

   def step3_save
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:street] = user_params[:street]
    session[:post_number] = user_params[:post_number]
    session[:building] = user_params[:building]
    session[:phone_number] = user_params[:phone_number]
    # binding.pry
    @user = User.new(
     
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    first_name: session[:first_name],
    last_name: session[:last_name],
    first_name_kana: session[:first_name_kana],
    last_name_kana: session[:last_name_kana],
    phone_number: session[:phone_number],
    post_number: session[:post_number],
    prefecture: session[:prefecture],
    city: session[:city],
    street: session[:street],
    building: session[:building],
    birthday_year: session[:birthday_year],
    birthday_month: session[:birthday_month],
    birthday: session[:birthday]
    )
    # binding.pry
      if @user.save
        sign_in(@user)
        redirect_to  step4_users_path
      else
        render '/users/sign_up_choice'
      end
   end
   
   def step4
    @user = User.new
    @user = current_user
   end

   def step4_save
   @user = User.new(user_params)
   binding.pry
   if @user.save
    redirect_to step_complet_users_path, notice: '登録が完了しました'
  else
    redirect_to  step4_users_path
  end
   end

   private
   def user_params
     params.require(:user).permit(
       :nickname,
       :first_name, 
       :last_name,
       :first_name_kana,
       :last_name_kana,
       :password,
       :password_confirmation,
       :email, 
       :birthday_year,
       :birthday_month,
       :birthday,
       :prefecture,
       :phone_number,
       :post_number,
       :city,
       :street,
       :building,
       :cards)
    end
  end