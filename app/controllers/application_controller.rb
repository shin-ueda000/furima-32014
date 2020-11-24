class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def 
    configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:password_confirmation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_katakana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_katakana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])

  end
end
