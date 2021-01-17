FactoryBot.define do
  factory :objective do
    association :user
    title { Faker::Lorem.word }
    category_id { Faker::Number.between(from: 1, to: 4) }
    wish { Faker::Lorem.sentence }
    outcome { Faker::Lorem.sentence }
    obstacle { Faker::Lorem.sentence }
    plan { Faker::Lorem.sentence }
  end
end
