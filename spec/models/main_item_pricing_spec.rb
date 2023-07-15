require 'rails_helper'

RSpec.describe MainItemPricing, type: :model do
  it 'has a valid factory' do
    expect(build(:main_item_pricing)).to be_valid
  end

  # it { belong_to(:item).class_name('Item')}
  it { belong_to(:pricing).class_name('Pricing')}
end
