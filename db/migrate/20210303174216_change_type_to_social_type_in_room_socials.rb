class ChangeTypeToSocialTypeInRoomSocials < ActiveRecord::Migration[6.1]
  def change
    rename_column :room_socials, :type, :social_type
  end
end
