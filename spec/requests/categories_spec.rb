require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create!(name: 'test', email: 'test@localhost', password: 'test123')
    sign_in @user
  end

  describe 'GET /categories' do
    it 'returns http success' do
      get '/categories'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /categories/:id' do
    it 'returns http success' do
      category = Category.create(name: 'test', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: @user)
      get category_path(category)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /categories/new' do
    it 'returns http success' do
      get '/categories/new'
      expect(response).to have_http_status(:success)
    end
  end
end
