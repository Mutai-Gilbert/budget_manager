require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  before do
    # Create a test user
    @user = User.create!(name: 'test', email: 'test@localhost', password: 'test123')

    # Create test categories associated with the user
    @categories = [
      Category.create!(name: 'Category 1', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: @user),
      Category.create!(name: 'Category 2', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: @user)
    ]

    render
  end

  it 'displays a link to categories page' do
    expect(rendered).to have_content('Category 1')
    expect(rendered).to have_content('Category 2')
  end

  it 'displays category names and icons' do
    expect(rendered).to have_content('Category 1')
    expect(rendered).to have_content('Category 2')
    expect(rendered).to have_selector('img[src="https://images.app.goo.gl/xb4zqArZJgZHrJFF6"]')
  end
end
