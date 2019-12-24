class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
    # binding.pry
  end

  def google_oauth2
    callback_for(:google)
  end

  private
  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #after_sign_in_path_forと同じパス
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to sign_up_choice_users_path
    end
  end

  def failure
    redirect_to root_path and return
  end
end
