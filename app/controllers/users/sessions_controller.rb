class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :check_mock_auth, if: -> { Rails.env.development? || Rails.env.test? }

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def check_mock_auth
    return unless params[:user]

    user = authenticate_mock_user(params[:user][:email], params[:user][:password])
    return unless user

    sign_in(user)
    redirect_to after_sign_in_path_for(user) and return
  end
end
