class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :band

  validates :start_date, :end_date, :band_name, presence: true
  validate :end_date_after_start_date
  
  private
  
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "Must be after the start date")
    end
  end
end
