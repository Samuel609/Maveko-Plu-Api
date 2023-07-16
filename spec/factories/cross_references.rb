FactoryBot.define do
  factory :cross_reference do
    item_description { Faker::Lorem.sentence }
    supplier_id { Faker::Number.number(digits: 4) }
    maveko_id { Faker::Number.number(digits: 4) }
    customer_id { Faker::Number.number(digits: 4) }
  end
end
