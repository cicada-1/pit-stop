class Room < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :room_reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :room_socials, dependent: :destroy
  has_many :chatrooms, dependent: :destroy

  PARKING_TYPES = ["street parking", "private parking", "car park", "unavailable"]

  validates :name, :postcode, :city, :country, :description, :bio, :parking, :capacity, presence: true
  validates :parking, inclusion: { in: PARKING_TYPES }
  validates :description, :bio, length: { maximum: 1000, message: "Limit is 1000 characters" }
  validates :capacity, numericality: { greater_than: 0 }
  geocoded_by :address
  after_validation :geocode, if: -> { :will_save_change_to_city? || :will_save_change_to_country? || :will_save_change_to_postcode? }

  def address
    "#{postcode}, #{city}, #{country}"
  end
end



