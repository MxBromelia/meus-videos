require 'rails_helper'

RSpec.describe "Index", type: :feature do
  feature "Index Shows Bookmarked Categories" do
    background do
      create :category, name: "Favoritado", bookmarked: true
      create :category, name: "Não Favoritado", bookmarked: false

      visit '/'
    end
  
    scenario "Show Bookmarked" do
      expect(page).to have_link("Favoritado")
    end
  
    scenario "Don't Show Unbookmarked" do
      expect(page).to_not have_link("Não Favoritado")
    end
  end

  scenario "No Bookmarked Categories" do
    visit '/'

    expect(page).to have_text("Não há Categorias Favoritadas")
  end

  scenario "Link to All Categories" do
    visit '/'

    expect(page).to have_link("Ver Todas as Categorias")
  end
end
