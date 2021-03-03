class RoomSocial < ApplicationRecord
  belongs_to :room

  validates :type, :profile_url, presence: true
  validates :type, inclusion: { in: %w[instagram twitter facebook] }
end
