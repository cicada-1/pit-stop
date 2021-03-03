class Band < ApplicationRecord
  has_many_attached :photos

  has_many :band_members
  has_many :gigs
  has_many :band_socials
  has_many :reviews
  has_many :bookings

  validates :name, :location, :description, :number_of_members, presence: true
  validates :description, length: { maximum: 1000, message: "Limit is 1000 characters" }
end
