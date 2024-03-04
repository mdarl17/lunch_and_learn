FactoryBot.define do
  factory :recipe do
    id { null }
    type { "recipe" }
    title { Faker::Food.dish }
    url { Faker::Internet.url }
    unit_price { Faker::Address.country }
    image_url { Faker::Internet.url }
  end
end