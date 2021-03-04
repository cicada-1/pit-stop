class RemoveAddressFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :address, :string
  end
end
