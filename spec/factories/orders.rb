FactoryBot.define do
  factory :order do
    item_name { Faker::String.random(length: 4) }
    customer_id { create(:customer).id }
  end
end
