class AddRoomToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :room, null: false, foreign_key: true
  end
end
