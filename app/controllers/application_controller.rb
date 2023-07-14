class ApplicationController < ActionController::Base
  before_action :authenticate_user_except_splash
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def authenticate_user_except_splash
    return if controller_name == 'splash' && action_name == 'index'

    authenticate_user!
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
