class RoomReview < ApplicationRecord
  belongs_to :room
  belongs_to :band

  validates :band_name, presence: true
  validates :content, presence: true, length: { maximum: 1000, message: "Limit is 1000 characters" }
end
