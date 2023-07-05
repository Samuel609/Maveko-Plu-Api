require 'rails_helper'

RSpec.describe SupplierItemPricing, type: :model do
  it 'has a valid factory' do
    expect(build(:supplier_item_pricing)).to be_valid
  end
  it { should validate_presence_of(:status) }
  it { should belong_to(:item_id).class_name('Item') }
  it { should belong_to(:supplier_id).class_name('Supplier') }
  it { should belong_to(:pricing_id).class_name('Pricing') }
  
end
