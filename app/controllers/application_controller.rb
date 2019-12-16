class ApplicationController < ActionController::Base

  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
<<<<<<< HEAD
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
                                                       :building])
  end

end

# :fullname,
# :cards
# :comment,
#                                                        :good,
#                                                        :sellitem,
#                                                        :buyitem]
=======
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
    :building])
  end

end
>>>>>>> 2e15b99f23481d57c770b2b93dd7c37607c7bce7
