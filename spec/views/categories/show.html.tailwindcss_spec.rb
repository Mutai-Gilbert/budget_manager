require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before do
    @user = User.create!(name: 'test', email: 'test@localhost', password: 'test123')
    @category = Category.create!(name: 'test', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: @user)
    @transaction_entry = TransactionEntry.create!(name: 'test', amount: 100, user: @user)
    @transaction_entry.save

    assign(:category, @category)
    assign(:transaction_entries, [@transaction_entry])

    render
  end

  it 'displays Category Name' do
    expect(rendered).to have_content('test')
  end

  it 'displays Category Icon' do
    expect(rendered).to have_css("img[src='https://images.app.goo.gl/xb4zqArZJgZHrJFF6']")
  end

  it 'displays Transaction Entries' do
    expect(rendered).to have_content('100')
  end
end
