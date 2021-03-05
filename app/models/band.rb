class Band < ApplicationRecord
  has_many_attached :photos

  has_many :band_members, dependent: :destroy
  has_many :users, through: :band_members
  has_many :gigs, dependent: :destroy
  has_many :band_socials, dependent: :destroy
  has_many :band_reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, :location, :description, :number_of_members, presence: true
  validates :description, length: { maximum: 1000, message: "Limit is 1000 characters" }
end
