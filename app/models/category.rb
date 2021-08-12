class Category < ApplicationRecord
  attribute :bookmarked, :boolean, default: false

  validates_presence_of :name
  validates_inclusion_of :bookmarked, in: [false, true]

  scope :bookmarked, lambda {
      where(bookmarked: true)
  }
end
