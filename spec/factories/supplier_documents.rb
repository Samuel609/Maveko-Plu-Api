FactoryBot.define do
  factory :supplier_document do
    reference_no { "MyString" }
    supplier_id { create(:supplier).id  }
  end
end
