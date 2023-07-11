FactoryBot.define do
  factory :notification do
    title {Faker::Lorem.word}
    body {Faker::Lorem.sentence}
    sender {Faker::Lorem.word}
    status {Notification::UNREAD}
    delivery_date {Faker::Date.forward(days: 12)}
    
  end
end
