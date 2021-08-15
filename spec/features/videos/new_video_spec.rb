require 'rails_helper'

RSpec.describe "Adding a video to a Category", type: :feature do
  let(:category) { create :category }
  let(:id) { category.id }

  feature "Adding a new Category" do
    background do
      visit "categories/#{id}"

      click_link "Adicionar Vídeo"
    end

    scenario "Successfully adding a Video to a Category" do
      fill_in "URL", with: "https://www.youtube.com/watch?v=jNQXAC9IVRw"
      fill_in "Título", with: "Me at the zoo"

      click_button "Cadastrar"
      expect(page).to have_content "Vídeo Adicionado com Sucesso"
    end

    scenario "Sending an Empty Form" do
      click_button "Cadastrar"
      expect(page).to have_content "Erros Encontrados"
    end
  end
end
