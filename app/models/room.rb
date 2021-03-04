class Room < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :reviews
  has_many :bookings
  has_many :room_socials

  PARKING_TYPES = %w[private street unavailable]

  validates :name, :city, :postcode, :country, :description, :bio, :parking, :capacity, presence: true
  validates :parking, inclusion: { in: PARKING_TYPES }
  validates :description, :bio, length: { maximum: 1000, message: "Limit is 1000 characters" }
  validates :capacity, numericality: { greater_than: 0 }
  geocoded_by :address
  after_validation :geocode, if: -> { :will_save_change_to_city? || :will_save_change_to_country? || :will_save_change_to_postcode? }

  def address
    "#{city}, #{country}, #{postcode}"
  end
end



