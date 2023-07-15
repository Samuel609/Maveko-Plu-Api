require 'rails_helper'

RSpec.describe SupplierItemPricing, type: :model do
  it 'has a valid factory' do
    expect(build(:supplier_item_pricing)).to be_valid
  end
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:reference_number) }
  it { should belong_to(:item).class_name('Item') }
  it { should belong_to(:supplier).class_name('Supplier') }
  it { should belong_to(:pricing).class_name('Pricing') }
  
end
