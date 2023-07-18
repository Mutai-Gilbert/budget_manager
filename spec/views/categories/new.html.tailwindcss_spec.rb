require 'rails_helper'

RSpec.describe 'Category/New', type: :system do
  describe 'category new page' do
    before do
      @user = User.create!(name: 'test', email: 'test@localhost', password: 'test123')

      visit new_category_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'

      fill_in 'Name', with: 'test'
      fill_in 'Icon', with: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6'
      click_button 'Create'
    end

    it 'Category Name' do
      expect(page).to have_content('test')
    end

    it 'Category Icon' do
      expect(page).to have_css("img[src='https://images.app.goo.gl/xb4zqArZJgZHrJFF6']")
    end
  end
end
