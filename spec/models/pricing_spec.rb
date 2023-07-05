require 'rails_helper'

RSpec.describe Pricing, type: :model do
  it 'has a valid factory' do
    expect(build(:pricing)).to be_valid
  end

  it { is_expected.to validate_presence_of(:price_in_euro) }
  it { is_expected.to validate_presence_of(:old_purchase_price) }
  it { is_expected.to validate_presence_of(:valid_from_old_purchase) }
  it { is_expected.to validate_presence_of(:new_purchase_price) }
  it { is_expected.to validate_presence_of(:valid_from_new_purchase) }
  it { is_expected.to validate_presence_of(:valid_to_new_purchase) }
  it { is_expected.to validate_presence_of(:old_retail_price) }
  it { is_expected.to validate_presence_of(:new_retail_price) }
  it { is_expected.to validate_presence_of(:new_retail_price_valid_from) }
  it { is_expected.to validate_presence_of(:new_retail_price_valid_to) }
  it { is_expected.to validate_presence_of(:change_in_percentage) }
end
