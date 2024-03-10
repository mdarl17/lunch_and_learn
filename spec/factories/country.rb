FactoryBot.define do 
  factory :country, class: Hash do 
    sequence(:id) { |n| n } 
    name { Faker::Address.country }

    initialize_with { attributes }
  end
end
