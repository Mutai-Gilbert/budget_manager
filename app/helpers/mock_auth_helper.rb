module MockAuthHelper
  def mock_auth_enabled?
    Rails.env.development? || Rails.env.test?
  end

  def mock_credentials
    return unless mock_auth_enabled?

    {
      email: MockAuthentication::MOCK_USER[:email],
      password: MockAuthentication::MOCK_USER[:password]
    }
  end
end
