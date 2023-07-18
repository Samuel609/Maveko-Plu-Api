FactoryBot.define do
  factory :supplier_item_request do
    item_code { Faker::Code.npi }
    item_description { Faker::Lorem.sentence  }
    dimensions { 10 }
    price_per_pc { 100 }
    base_unit { Faker::Lorem.word }
    target_unit { Faker::Lorem.word }
    supplier_document_id {create(:supplier_document).id}
    currency { Faker::Lorem.word }
    valid_from { Faker::Date.between(from: '2020-01-01', to: '2020-12-31') }
    valid_to { Faker::Date.between(from: '2020-01-01', to: '2020-12-31') }
    new_price { 100 }
    
  end
end
