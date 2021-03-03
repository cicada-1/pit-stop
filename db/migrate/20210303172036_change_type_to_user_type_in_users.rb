class ChangeTypeToUserTypeInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :type, :user_type
  end
end
