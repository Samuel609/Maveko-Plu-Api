require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'has a valid factory' do
    expect(build(:item)).to be_valid
  end

  it { should validate_presence_of(:item_code) }
  it { should validate_presence_of(:decor_code) }
  it { should validate_presence_of(:item_name) }
  it { should validate_presence_of(:item_description) }
  it { should validate_presence_of(:dimensions) }
  it { should validate_presence_of(:article_group) }
  it { should validate_presence_of(:tax_class) }
  it { should validate_presence_of(:weight) }
  it { should validate_presence_of(:base_unit_id) }
  it { should validate_presence_of(:target_unit_id) }

  it { should belong_to(:base_unit).class_name('UnitOfMeasure') }
  it { should belong_to(:target_unit).class_name('UnitOfMeasure') }
end
