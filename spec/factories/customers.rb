FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age { Faker::Number.between(from: 1, to: 100) }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
