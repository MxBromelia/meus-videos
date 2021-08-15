require 'rails_helper'

RSpec.describe "Videos", type: :request do
  let(:category) { create :category }
  let(:category_id) { category.id }

  let(:video) { create :video }
  let(:id) { video.id }

  describe "GET /new" do
    it "returns http success" do
      get "/categories/#{category_id}/videos/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /" do
    before do
      delete "/videos/#{id}"
    end

    it "return http success" do
      expect(response).to have_http_status(:success)
    end

    it "removes the record" do
      expect { video.reload }.to raise_error { ActiveRecord::RecordNotFound }
    end
  end

end
