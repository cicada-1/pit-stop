class AddCountryCityPostcodeToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :country, :string
    add_column :rooms, :city, :string
    add_column :rooms, :postcode, :string
  end
end
