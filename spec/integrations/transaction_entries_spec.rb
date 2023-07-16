require 'rails_helper'

RSpec.describe TransactionEntry, type: :feature do
  let!(:user) { User.create!(name: 'test', email: 'test@localhost', password: 'test123') }
  before do
    user.confirm
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    @category = Category.create(name: 'test', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: user)
    @transaction_entries = @category.transaction_entries.create(name: 'test', amount: 100, user: user)
    @transaction_entries2 = @category.transaction_entries.create(name: 'test2', amount: 100, user: user)

    visit "/categories/#{@category.id}/transaction_entries"
  end

  it 'The page displays a list of transaction entries' do
    expect(page).to have_content('test')
    expect(page).to have_content('test2')
  end

  it 'The page displays an icon' do
    expect(page).to have_css("img[src='#{@transaction_entries.icon}']")
    expect(page).to have_css("img[src='#{@transaction_entries2.icon}']")
  end

  it 'redirects to the transaction_entries show page' do
    click_link 'test'
    expect(page).to have_current_path(transaction_entries_path(@transaction_entries))
  end

  it 'redirects to the transaction_entries new page' do
    click_link 'test'
    expect(page).to have_current_path(new_transaction_entry_path(@category))
  end
end
