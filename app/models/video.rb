class Video < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :url
  validates_format_of :url, with: URI.regexp

  before_create :extract_video_id

  def embed_url
    "https://www.youtube.com/embed/#{video_id}"
  end

  def thumbnail_url
    "https://img.youtube.com/vi/#{video_id}/mqdefault.jpg"
  end

  private

  def extract_video_id
    str_query = URI.parse(url).query
    query = Hash[URI.decode_www_form(str_query)]

    self.video_id = query["v"]
  end
end
