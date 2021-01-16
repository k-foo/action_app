FactoryBot.define do
  factory :user do
    nickname { Faker::Games::Pokemon.name }
    email { Faker::Internet.unique.email }
    # ランダムで生成する際、英数字になるよう'1a'追加
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    birthdate { Faker::Date.birthday }
  end
end
