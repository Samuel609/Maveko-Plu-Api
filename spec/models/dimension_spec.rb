require 'rails_helper'

RSpec.describe Dimension, type: :model do
  it 'has a valid factory' do
    expect(build(:dimension)).to be_valid
  end
  
  it { should validate_presence_of(:length)}
  it { should validate_presence_of(:width)}
  it { should validate_presence_of(:height)}

  it { is_expected.to(validate_numericality_of(:length).is_greater_than(0)) }
  it { is_expected.to(validate_numericality_of(:width).is_greater_than(0)) }
  it { is_expected.to(validate_numericality_of(:height).is_greater_than(0)) }


end
