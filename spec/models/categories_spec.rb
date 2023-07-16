require 'rails_helper'

RSpec.describe Category, type: :model do
  @user = User.create!(name: 'test', email: 'test1@category.com', password: 'test123')
  subject { Category.new(name: 'test', icon: 'https://images.app.goo.gl/xb4zqArZJgZHrJFF6', user: @user) }
  before { subject.save! }

  before { subject.save }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a name and an icon' do
    subject.name = nil
    subject.icon = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a name, an icon, and a user' do
    subject.name = nil
    subject.icon = nil
    subject.user = nil
    expect(subject).to_not be_valid
  end
end
