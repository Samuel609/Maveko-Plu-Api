require 'rails_helper'

RSpec.describe UnitOfMeasure, type: :model do
  it 'has a valid factory' do
    expect(build(:unit_of_measure)).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:unit) }
end
