FactoryBot.define do
  factory :supplier_item_pricing do
    status { Faker::Lorem.word  }
    reference_number { Faker::Lorem.word }
    item { association :item }
    supplier { association :supplier }
    pricing { association :pricing }
    
  end
end
