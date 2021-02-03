FactoryBot.define do
  factory :problem do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    association :user
  end
end
