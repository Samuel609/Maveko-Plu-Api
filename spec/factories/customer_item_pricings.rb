FactoryBot.define do
  factory :customer_item_pricing do
    customer { association :customer }
    pricing { association :pricing }
  end
end
