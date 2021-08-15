FactoryBot.define do
  factory :comment do
    message { Faker::Lorem.paragraph }
    
    association :video
  end
end
