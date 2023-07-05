FactoryBot.define do
  factory :main_item_pricing do
    item { association :item }
    pricing { association :pricing }
    
  end
end
