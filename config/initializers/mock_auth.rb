if Rails.env.development? || Rails.env.test?
  module MockAuthentication
    MOCK_USER = {
      email: 'test@example.com',
      password: 'password123',
      name: 'Test User'
    }

    def authenticate_mock_user(email, password)
      return nil unless email == MOCK_USER[:email] && password == MOCK_USER[:password]
      
      User.find_or_create_by!(
        email: MOCK_USER[:email]
      ) do |user|
        user.name = MOCK_USER[:name]
        user.password = MOCK_USER[:password]
        user.password_confirmation = MOCK_USER[:password]
      end
    end
  end

  # Wait for Rails to load before including helpers
  Rails.application.config.to_prepare do
    ApplicationController.include MockAuthentication
  end
end 