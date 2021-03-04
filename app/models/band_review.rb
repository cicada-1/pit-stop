class BandReview < ApplicationRecord
  belongs_to :room
  belongs_to :band

  validates :content, presence: true, length: { maximum: 1000, message: "Limit is 1000 characters" }
end
