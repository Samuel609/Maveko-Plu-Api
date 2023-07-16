FactoryBot.define do
  factory :supplier_item_request do
    item_code { "MyString" }
    item_description { "MyString" }
    dimensions { "MyString" }
    price_per_pc { "MyString" }
    base_unit { "MyString" }
    target_unit { "MyString" }
    supplier_document_id {create(:supplier_document).id}
  end
end
