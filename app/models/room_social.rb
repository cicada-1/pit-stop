class RoomSocial < ApplicationRecord
  belongs_to :room

  SOCIAL_TYPES = %w[Instagram Twitter Facebook]

  validates :user_type, :profile_url, presence: true
  validates :user_type, inclusion: { in: SOCIAL_TYPES }
end
