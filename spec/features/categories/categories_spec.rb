require 'rails_helper'

RSpec.describe "Listing Categories", type: :feature do
  feature "Listing Categories" do
    background do
      create :category, bookmarked: true, name: "Favoritado"
      create :category, bookmarked: false, name: "Não Favoritado"
      visit 'categories/'
    end

    scenario "Bookmarked Categories Show in Index" do
      expect(page).to have_content("Favoritado")
    end

    scenario "Unbookmarked Categories Show in Index" do
      expect(page).to have_content("Não Favoritado")
    end
  end
end
