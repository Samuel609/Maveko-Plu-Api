FactoryBot.define do
  factory :supplier_item_pricing do
    status { Faker::Lorem.word  }
    supplier { association :supplier }
    pricing { association :pricing }
    
  end
end
