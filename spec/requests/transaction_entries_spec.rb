require 'rails_helper'

RSpec.describe 'TransactionEntries', type: :request do
  before :each do
    @user = User.create!(name: 'test', email: 'test@localhost', password: 'test123')
    @category = Category.create!(name: 'test', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: @user)
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/transaction_entries'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/transaction_entries/new'
      expect(response).to have_http_status(:success)
    end
  end
end
