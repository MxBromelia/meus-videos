FactoryBot.define do
  factory :video do
    url { Faker::Internet.url(host: 'youtube.com', scheme: 'https', path: "/watch?v=#{video_id}") }
    title { Faker::Lorem.sentence }

    transient do
      video_id { Faker::Lorem.characters(number: 6) }
      comments_count { 1 }
    end

    association :category

    after(:create) do |video, evaluator|
      return if video.comments.any?

      create_list :comment, evaluator.comments_count, video: video
      video.reload
    end
  end
end
