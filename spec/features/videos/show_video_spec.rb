require 'rails_helper'

RSpec.describe "Showing A Video", type: :feature do
  let(:id) { video.id }

  feature "Showing a Video with comments" do
    let!(:video) { create :video }
    scenario "With Comments" do
      create_list :comment, 3, video: video
      visit "/videos/#{id}"

      video.comments.each do |comment|
        expect(page).to have_text comment.message
      end
    end
  end

  feature "Showing a Video without comments" do
    let!(:video) { create :video, comments_count: 0 }
    scenario "Without Comments" do
      visit "/videos/#{id}"
      expect(page).to have_text("Este vídeo não possui comentários")
    end
  end
end
