FactoryBot.define do
  factory :customer do
    name { Faker::Name.name  }
    user_id { create(:user).id }
  end
end
