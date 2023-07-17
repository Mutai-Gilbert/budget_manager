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

  it 'displays the category name' do
    expect(rendered).to have_selector('h1', text: @category.name)
  end

  it 'displays the total amount' do
    expect(rendered).to have_selector('p', text: "Total Amount: $#{@total_sum}")
  end

  it 'displays transaction entries' do
    @transaction_entries.each do |transaction|
      expect(rendered).to have_selector('h3', text: transaction.name)
      expect(rendered).to have_selector('p', text: "Amount: $#{transaction.amount}")
      expect(rendered).to have_selector('div', text: transaction.created_at.strftime('%d %b %Y at %l:%M %p'))
    end
  end
end
