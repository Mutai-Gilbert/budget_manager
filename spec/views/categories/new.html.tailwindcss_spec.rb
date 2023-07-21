require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  before do
    @category = Category.new
  end

  it 'displays the form to create a new category' do
    render

    expect(rendered).to have_selector('form')
    expect(rendered).to have_selector('form[action="/categories"][method="post"]')
    expect(rendered).to have_selector('input[type="text"][name="category[name]"]')
    expect(rendered).to have_selector('input[type="text"][name="category[icon]"]')
    expect(rendered).to have_selector('input[type="submit"][value="Create"]')
  end
end
