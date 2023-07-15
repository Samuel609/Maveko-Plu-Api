FactoryBot.define do
  factory :customer_formula do
    margin { 3 }
    active { true }
    customer_id { create(:customer).id }
  end
end
