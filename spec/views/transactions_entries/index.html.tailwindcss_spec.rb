require 'rails_helper'

RSpec.describe 'transaction_entries/index', type: :view do
  before do
    @user = User.create!(name: 'test', email: 'test@localhost', password: 'test123')
    @category = Category.create!(name: 'test', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: @user)
    @transaction_entries = [
      TransactionEntry.create!(name: 'Transaction 1', amount: 100, created_at: Time.now, user: @user),
      TransactionEntry.create!(name: 'Transaction 2', amount: 200, created_at: Time.now, user: @user)
    ]
    @total_sum = @transaction_entries.sum(&:amount)

    render
  end

  it 'displays the page name' do
    expect(rendered).to have_selector('h1', text: 'Transactions')
  end

  it 'displays the category name' do
    expect(rendered).to have_selector('h2', text: @category.name)
  end
end
