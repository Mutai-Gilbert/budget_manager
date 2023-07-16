require 'rails_helper'

RSpec.describe Category, type: :feature do
  let!(:user) { User.create!(name: 'test', email: 'test@localhost', password: 'test123') }
  before do
    user.confirm

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    @category = Category.create!(name: 'test', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: user)
    @category2 = Category.create!(name: 'test2', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: user)
    visit categories_path
  end

  it 'The page displays a list of categories' do
    expect(page).to have_content('test')
    expect(page).to have_content('test2')
  end

  it 'The page displays an icon' do
    expect(page).to have_css("img[src='#{@category.icon}']")
    expect(page).to have_css("img[src='#{@category1.icon}']")
  end

  it 'redirects to the category show page' do
    click_link 'test'
    expect(page).to have_current_path(category_path(@category))
  end
end
