class BandMember < ApplicationRecord
  belongs_to :user
  belongs_to :band
  has_one_attached :photo
end
