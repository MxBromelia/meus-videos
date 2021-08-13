require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:category) { create :category }
  let(:id) { category.id }

  describe "GET /index" do
    it "returns http success" do
      get "/categories/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/categories/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/categories/#{id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /bookmark" do
    it 'bookmarks a category' do
      patch "/categories/#{id}/bookmark", params: {bookmark: true}

      expect(response).to have_http_status(:success)
      expect(category.reload.bookmarked).to eq(true)
    end

    it 'unbookmarks a category' do
      category.update(bookmarked: true)
      patch "/categories/#{id}/bookmark", params: {bookmark: false}

      expect(response).to have_http_status(:success)
      expect(category.reload.bookmarked).to eq(false)
    end
  end

  describe 'DELETE /' do
    it 'removes the record' do
      delete "/categories/#{id}/"

      expect { category.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
