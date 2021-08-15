class Video < ApplicationRecord
  belongs_to :category

  validates_presence_of :title, :url
  validates_format_of :url, with: URI.regexp

  before_create :extract_video_id

  def embed_url
    "https://www.youtube.com/embed/#{video_id}"
  end

  private

  def extract_video_id
    str_query = URI.parse(url).query
    query = Hash[URI.decode_www_form(str_query)]

    self.video_id = query["v"]
  end
end
