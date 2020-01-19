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

    if session[:provider].present? && session[:uid].present?
      password = Devise.friendly_token.first(7)
      @user = User.new(nickname:session[:nickname], email: session[:email], password: "password", password_confirmation: "password", first_name: session[:first_name],last_name: session[:last_name], first_name_kana: session[:first_name_kana], last_name_kana: session[:last_name_kana], birthday_year: session[:birthday_year],birthday_month: session[:birthday_month],birthday: session[:birthday])
    else
      @user = User.new(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], first_name: session[:first_name],last_name: session[:last_name], first_name_kana: session[:first_name_kana], last_name_kana: session[:last_name_kana], birthday_year: session[:birthday_year],birthday_month: session[:birthday_month],birthday: session[:birthday])
    end

    if @user.valid?(:sample)
      render "users/step2"
    else
      @user.errors.messages
      render 'users/step1'
    end
    
   end

  def step2
  end

  def step2_save
    session[:phone_number] = user_params[:phone_number]
    p_prefecture = "1"
    p_city = "未記入"
    p_street = "未記入"
    p_building = "未記入"
    
    if session[:provider].present? && session[:uid].present?
      password = Devise.friendly_token.first(7)
      @user = User.new(nickname:session[:nickname], email: session[:email], password: "password", password_confirmation: "password", first_name: session[:first_name],last_name: session[:last_name], first_name_kana: session[:first_name_kana], last_name_kana: session[:last_name_kana], birthday_year: session[:birthday_year],birthday_month: session[:birthday_month],birthday: session[:birthday],phone_number: session[:phone_number],
        post_number: 1234567,
        prefecture: p_prefecture,
        city: p_city,
        street: p_street,
        building: p_building)

      sns = SnsCredential.new(user_id: @user.id,uid: session[:uid], provider: session[:provider])
    else
      @user = User.new(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], first_name: session[:first_name],last_name: session[:last_name], first_name_kana: session[:first_name_kana], last_name_kana: session[:last_name_kana], birthday_year: session[:birthday_year],birthday_month: session[:birthday_month],birthday: session[:birthday],phone_number: session[:phone_number],
        post_number: 1234567,
        prefecture: p_prefecture,
        city: p_city,
        street: p_street,
        building: p_building)
    end

    if @user.valid?
      render 'users/step3'
    else
      @user.errors.messages
      render 'users/step2'
    end
   
  end

  def step3
  end

  def step3_save
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:street] = user_params[:street]
    session[:post_number] = user_params[:post_number]
    session[:building] = user_params[:building]

    if session[:provider].present? && session[:uid].present?
      password = Devise.friendly_token.first(7)
      @user = User.new(nickname:session[:nickname], email: session[:email], password: "password", password_confirmation: "password", first_name: session[:first_name],last_name: session[:last_name], first_name_kana: session[:first_name_kana], last_name_kana: session[:last_name_kana], birthday_year: session[:birthday_year],birthday_month: session[:birthday_month],birthday: session[:birthday],phone_number: session[:phone_number],
        post_number:session[:post_number],prefecture: session[:prefecture], city:session[:city], street:session[:street], building:session[:building])
    else
      @user = User.new(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], first_name: session[:first_name],last_name: session[:last_name], first_name_kana: session[:first_name_kana], last_name_kana: session[:last_name_kana], birthday_year: session[:birthday_year],birthday_month: session[:birthday_month],birthday: session[:birthday],phone_number: session[:phone_number],
        post_number:session[:post_number], prefecture: session[:prefecture], city:session[:city], street:session[:street], building:session[:building])
    end
      if @user.save 
        if session[:password].present? && session[:password_confirmation].present?
          session[:password].clear
          session[:password_confirmation].clear
        else
          session[:uid].clear
          session[:provider].clear
        end
        sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
        sign_in(@user)
        redirect_to controller: '/card2s', action: 'step4'
        session[:nickname].clear
        session[:email].clear
        session[:first_name].clear
        session[:last_name].clear
        session[:first_name_kana].clear
        session[:last_name_kana].clear
        session[:birthday_year].clear
        session[:birthday_month].clear
        session[:birthday].clear
        session[:phone_number].clear
        session[:prefecture].clear
        session[:city].clear
        session[:street].clear
        session[:post_number].clear
        session[:building].clear
      else
        @user.errors.messages
        render 'users/step3'
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