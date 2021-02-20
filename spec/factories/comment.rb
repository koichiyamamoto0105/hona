FactoryBot.define do
  factory :comment do
    title { Faker::Lorem.characters(number:5) }
    comment { Faker::Lorem.characters(number: 20) }
    user
    map
  end
end