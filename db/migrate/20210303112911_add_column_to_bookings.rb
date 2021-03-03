class AddColumnToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :room, null: false, foreign_key: true
    add_reference :bookings, :band, null: false, foreign_key: true
  end
end
