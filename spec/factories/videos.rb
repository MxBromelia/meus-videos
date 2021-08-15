FactoryBot.define do
  factory :video do
    url { Faker::Internet.url(host: 'youtube.com', scheme: 'https', path: "/watch?v=#{video_id}") }
    title { Faker::Lorem.sentence }

    transient do
      video_id { Faker::Lorem.characters(number: 6) }
    end

    association :category
  end
end
