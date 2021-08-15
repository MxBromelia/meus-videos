require 'rails_helper'

RSpec.describe "Adding a video to a Category", type: :feature do
  let(:category) { create :category }
  let(:id) { category.id }

  feature "displaying videos in a Category" do
    scenario "Listing all category videos" do
      visit "categories/#{id}"
      category.videos.pluck(:title).each do |title|
        expect(page).to have_link title
      end
    end
  end

  feature "No videos in a Category" do
    let(:category) { create :category, videos_count: 0 }
    scenario "No videos in a Category" do
      visit "categories/#{id}"
      expect(page).to have_content "Não há videos nesta Categoria"
    end
  end
end
