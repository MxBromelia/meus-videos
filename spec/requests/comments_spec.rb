require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:video) { create :video }
  let(:video_id) { video.id }

  let(:comment) { create :comment, video: video }
  let(:id) { comment.id }
  describe 'POST /videos/:video_id/comments' do
    it {
      headers = { "CONTENT_TYPE": "application/json" }
      valid_attributes = { comment: attributes_for(:comment) }.to_json

      post "/videos/#{video_id}/comments", params: valid_attributes, headers: headers

      expect(response).to have_http_status(:found)
    }
  end

  describe 'DELETE /comments/:id' do
    before do
      delete "/comments/#{id}"
    end
    it "returns an ok status" do
      expect(response).to have_http_status(:found)
    end

    it "removes a comment" do
      expect { comment.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
