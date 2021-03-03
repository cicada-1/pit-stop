class BandSocial < ApplicationRecord
  belongs_to :band

  SOCIAL_TYPES = %w[Instagram Twitter Facebook Bandcamp Soundcloud Website]

  validates :type, :profile_url, presence: true
  validates :type, inclusion: { in: SOCIAL_TYPES }
end
