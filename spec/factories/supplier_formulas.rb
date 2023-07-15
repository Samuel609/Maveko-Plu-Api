FactoryBot.define do
  factory :supplier_formula do
    margin { 3 }
    active { true }
    supplier_id { create(:supplier).id }

  end
end
