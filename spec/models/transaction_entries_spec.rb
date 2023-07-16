require 'rails_helper'

RSpec.describe TransactionEntry, type: :model do
  @user = User.create!(name: 'test', email: 'transaction@models.com', password: 'test123')
  subject { TransactionEntry.new(name: 'test', amount: 100, user: @user) }
  before { subject.save! }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name and an amount' do
    subject.name = nil
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
