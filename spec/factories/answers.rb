FactoryBot.define do
  factory :answer do
    text { Faker::Lorem.sentence }
    association :user
    association :problem
  end
end
