require 'rails_helper'

RSpec.describe Notification, type: :model do
  it 'has a valid factory' do
    expect(build(:notification)).to be_valid
  end
  
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:body)}
  it { should validate_presence_of(:sender)}
  it { should validate_presence_of(:status)}
  it { should validate_presence_of(:delivery_date)}

end