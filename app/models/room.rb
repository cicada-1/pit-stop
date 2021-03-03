class Room < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :reviews
  has_many :bookings
  has_many :room_socials

  validates :name, :address, :description, :bio, :parking, :capacity, presence: true
  validates :parking, inclusion: { in: %w[private street unavailable] }
  validates :description, :bio, length: { maximum: 1000, message: "Limit is 1000 characters" }
end
