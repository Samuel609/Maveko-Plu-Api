FactoryBot.define do
  factory :notificaiton do
    title {Faker::Lorem.word}
    body {Faker::Lorem.sentence}
    sender {Faker::Lorem.word}
    status {Faker::Lorem.word}
    delivery_date {Faker::Date.forward(days: 12)}
    
  end
end
