require 'rails_helper'

RSpec.describe CrossReference, type: :model do
  it 'has a valid factory' do
    expect(build(:cross_reference)).to be_valid
  end

  it { is_expected.to validate_presence_of(:item_description) }
  it { is_expected.to validate_presence_of(:supplier_id) }
  it {is_expected.to validate_uniqueness_of(:supplier_id)}
  it { is_expected.to validate_presence_of(:maveko_id) }
  it {is_expected.to validate_uniqueness_of(:maveko_id)}
  it { is_expected.to validate_presence_of(:customer_id) }
  it {is_expected.to validate_uniqueness_of(:customer_id)}
end
