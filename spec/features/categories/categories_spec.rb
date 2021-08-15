require 'rails_helper'

RSpec.describe "Listing Categories", type: :feature do
  let!(:category) { create :category }

  feature "Listing Categories" do
    background do
      visit 'categories/'
    end

    scenario "Show All Categories in Index" do
      expect(page).to have_content(category.name)
    end
  end
end
