require 'rails_helper'

RSpec.describe "transaction_entries/new", type: :view do
  before do
    @user = User.create!(name: 'test', email: 'test@localhost', password: 'test123')
    @category = Category.create!(name: 'test', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: @user)
    @transaction_entry = TransactionEntry.new(name: 'test', amount: 100, user: @user)
    render
  end

  it 'displays the new transaction entry form' do
    expect(rendered).to have_selector('form') do |form|
      expect(form).to have_field('Name')
      expect(form).to have_field('Amount')
      expect(form).to have_button('Create')
    end
  end
end
