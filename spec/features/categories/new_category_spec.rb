require 'rails_helper'

RSpec.describe "Adding a new Category", type: :feature do
  feature "Adding a new Category" do
    background do
      visit 'categories'
      click_link "Adicionar Categoria"
    end

    scenario "Successfully adding a Category" do
      fill_in "Título", with: "Ruby on Rails Tutorials"
      fill_in "Descrição", with: "RoR-related tutorials"
      
      click_button "Cadastrar"
      expect(page).to have_content "Categoria Adicionada com Sucesso"
    end

    scenario "Sending an Empty Form" do
      click_button "Cadastrar"
      expect(page).to have_content "Erros Encontrados"
    end
  end
end
