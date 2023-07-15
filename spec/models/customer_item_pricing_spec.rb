require 'rails_helper'

RSpec.describe CustomerItemPricing, type: :model do
  it 'has a valid factory' do
    expect(build(:customer_item_pricing)).to be_valid
  end

  # it { should belong_to(:item).class_name('Item') }
  it { should belong_to(:customer).class_name('Customer') }
  it { should belong_to(:pricing).class_name('Pricing') }
end
