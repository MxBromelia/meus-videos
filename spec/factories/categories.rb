FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    bookmarked { false }
  end
end
