FactoryBot.define do
  factory :rule do
    association :user
    if_1 { '12文字以内のルール' }
    then_1 { '12文字以内のルール' }
    if_2 { '12文字以内のルール' }
    then_2 { '12文字以内のルール' }
    if_3 { '12文字以内のルール' }
    then_3 { '12文字以内のルール' }
    if_4 { '12文字以内のルール' }
    then_4 { '12文字以内のルール' }
    if_5 { '12文字以内のルール' }
    then_5 { '12文字以内のルール' }
  end
end
