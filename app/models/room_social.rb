class RoomSocial < ApplicationRecord
  belongs_to :room

  SOCIAL_TYPES = %w[Instagram Twitter Facebook]

  validates :type, :profile_url, presence: true
  validates :type, inclusion: { in: SOCIAL_TYPES }
end
