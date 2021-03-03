class Gig < ApplicationRecord
  belongs_to :band

  validates :date, :location, presence: true
end
