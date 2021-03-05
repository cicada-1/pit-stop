class AddBandNameToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :band_name, :string
  end
end
