require 'rails_helper'

RSpec.describe Video, type: :model do
  subject { create :video }

  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to allow_value("https://www.youtube.com/watch?v=dQw4w9WgXcQ").for(:url) }
  it { is_expected.to_not allow_value("not a valid url").for(:url) }
  it { is_expected.to belong_to(:category) }

  context "Video ID" do
    subject { create :video, url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ" }
    describe "extract video id" do
      it { expect(subject.video_id).to eq("dQw4w9WgXcQ") }
    end

    describe "#embed_url" do
      it { expect(subject.embed_url).to eq("https://www.youtube.com/embed/dQw4w9WgXcQ") }
    end
  end

end
