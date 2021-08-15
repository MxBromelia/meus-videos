FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    bookmarked { false }

    transient do
      videos_count { 1 }
    end

    after(:create) do |category, evaluator|
    return if category.videos.any?

    create_list :video, evaluator.videos_count, category: category
    category.reload
    end
  end
end
