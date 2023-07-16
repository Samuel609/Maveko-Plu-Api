require 'rails_helper'

RSpec.describe CustomerFormula, type: :model do
  it 'has a valid factory' do
    expect(build(:customer_formula)).to be_valid
  end

  it { should validate_presence_of(:active) }
  it { should validate_presence_of(:formula) }

  it { is_expected.to(validate_numericality_of(:formula).is_greater_than(0)) }
  it { should belong_to(:customer) }
end
