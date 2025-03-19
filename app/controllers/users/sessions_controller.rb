class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :check_mock_auth, if: -> { Rails.env.development? }

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

    if mock_credentials_valid?(params[:user])
      user = find_or_create_mock_user
      sign_in(user)
      
      respond_to do |format|
        format.html { redirect_to categories_path, notice: 'Signed in successfully!' }
        format.json { render json: { success: true, redirect: categories_path } }
      end
    end
  end

  def mock_credentials_valid?(params)
    params[:email] == 'test@example.com' && 
    params[:password] == 'password123'
  end

  def find_or_create_mock_user
    User.find_or_create_by!(email: 'test@example.com') do |user|
      user.password = 'password123'
      user.name = 'Test User'
    end
  end
end

