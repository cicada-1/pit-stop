class BandSocial < ApplicationRecord
  belongs_to :band

  SOCIAL_TYPES = %w[Instagram Twitter Facebook Bandcamp Soundcloud Website]

  validates :user_type, :profile_url, presence: true
  validates :user_type, inclusion: { in: SOCIAL_TYPES }
end
