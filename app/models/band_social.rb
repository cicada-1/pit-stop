class BandSocial < ApplicationRecord
  belongs_to :band

  SOCIAL_TYPES = %w[Instagram Twitter Facebook Bandcamp Soundcloud Website]

  validates :social_type, :profile_url, presence: true
  validates :social_type, inclusion: { in: SOCIAL_TYPES }
end
