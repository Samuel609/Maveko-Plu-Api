FactoryBot.define do
  factory :unit_of_measure do
    name { Faker::Lorem.word }
    unit { Faker::Lorem.word }
  end
end
