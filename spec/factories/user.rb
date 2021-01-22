FactoryBot.define do
  factory :user do
    # sequence(:name) { |n| "TEST_NAME#{n}"}
     name { Faker::Lorem.characters(number:10) }
  end
end