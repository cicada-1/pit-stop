class BandSocial < ApplicationRecord
  belongs_to :band

  validates :type, :profile_url, presence: true
  validates :type, inclusion: { in: %w[instagram twitter facebook bandcamp soundcloud website] }
end
