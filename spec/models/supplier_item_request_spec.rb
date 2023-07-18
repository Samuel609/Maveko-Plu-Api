require 'rails_helper'

RSpec.describe SupplierItemRequest, type: :model do
  it 'has a valid factory' do
    expect(build(:supplier_item_request)).to be_valid
  end
  it { should validate_presence_of(:item_code) }
  it { should validate_presence_of(:item_description) }
  it { should validate_presence_of(:dimensions) }
  it { should validate_presence_of(:price_per_pc) }
  it { should validate_presence_of(:base_unit) }
  it { should validate_presence_of(:target_unit) }
  it { should validate_presence_of(:currency) }
  it { should validate_presence_of(:valid_from) }
  it { should validate_presence_of(:valid_to) }
  it { should belong_to(:supplier_document).class_name('SupplierDocument') }
end
