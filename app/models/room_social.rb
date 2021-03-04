class RoomSocial < ApplicationRecord
  belongs_to :room

  SOCIAL_TYPES = %w[Instagram Twitter Facebook]

  validates :social_type, :profile_url, presence: true
  validates :social_type, inclusion: { in: SOCIAL_TYPES }
end
