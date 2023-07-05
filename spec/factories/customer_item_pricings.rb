FactoryBot.define do
  factory :customer_item_pricing do
    item { association :item }
    customer { association :customer }
    pricing { association :pricing }
  end
end
