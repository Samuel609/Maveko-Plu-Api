require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it 'has a valid factory' do
    expect(build(:supplier)).to be_valid
  end

  it { should validate_presence_of(:name) }
end
