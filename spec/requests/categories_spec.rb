require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before :each do
    @user = User.create!(name: 'test', email: 'test@localhost', password: 'test123')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/categories'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      Categories.create(name: 'test', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6')
      get categories_path(Categories.last)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/categories/new'
      expect(response).to have_http_status(:success)
    end
  end
end
