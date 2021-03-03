class Review < ApplicationRecord
  belongs_to :rooms
  belongs_to :bands

  validates :description, presence: true, length: { maximum: 1000, message: "Limit is 1000 characters" }
end
