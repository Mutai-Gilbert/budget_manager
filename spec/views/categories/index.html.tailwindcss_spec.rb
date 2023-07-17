require 'rails_helper'

RSpec.describe "Categories/Index", type: :system do
  describe "category index page" do
    before do
      @user = User.create!(name: 'test', email: 'test@localhost', password: 'test123')
      @category = Category.create!(name: 'test', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: @user)
      Category.create(name: 'test2', icon: 'https://images.app.goo.gl/bx4zqArZJgZHrJFF6', user: @user)

      visit categories_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    it "displays a list of categories" do
      expect(page).to have_content('test')
      expect(page).to have_content('test2')
    end

    it "displays 'No categories found.' when there are no categories" do
      Category.destroy_all

      visit categories_path

      expect(page).to have_content('No categories found.')
    end

    it "adds a new category when 'Add Category' button is clicked" do
      visit categories_path

      click_button 'Add Category'

      expect(page).to have_current_path(new_category_path)
    end
  end
end


