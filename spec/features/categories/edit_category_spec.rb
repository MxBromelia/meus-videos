require 'rails_helper'

RSpec.describe "Atualizar Categoria", type: :feature do
  feature "Adding a new Category" do
    background do
      visit "categories/#{category.id}/edit"
    end

    given(:category) { create :category }

    scenario "Successfully adding a Category" do
      fill_in "Título", with: "Ruby on Rails Tutorials"
      
      click_button "Atualizar"

      expect(page).to have_content "Categoria Atualizada com Sucesso"
      expect(category.reload.name).to eq("Ruby on Rails Tutorials")
    end

    scenario "Sending an Empty Form" do
      fill_in "Título", with: ""

      click_button "Atualizar"
      expect(page).to have_content "Erros Encontrados"
    end
  end
end
