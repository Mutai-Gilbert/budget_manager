require 'rails_helper'

RSpec.describe 'splash/index', type: :view do
  before do
    render
  end

  it 'displays the heading' do
    expect(rendered).to have_selector('h1', text: 'Budget Manager')
  end

  it 'displays the login link' do
    expect(rendered).to have_link('LOG IN', href: new_user_session_path)
  end

  it 'displays the sign-up link' do
    expect(rendered).to have_link('SIGN UP', href: new_user_registration_path)
  end
end
