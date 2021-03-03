class Gig < ApplicationRecord
  has_one_attached :photo
  belongs_to :band

  validates :date, :location, presence: true
end
