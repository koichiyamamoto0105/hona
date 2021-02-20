FactoryBot.define do
  factory :map do
     spotname { Faker::Lorem.characters(number:10) }
  end
end