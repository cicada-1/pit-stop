class CreateBands < ActiveRecord::Migration[6.1]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :number_of_members

      t.timestamps
    end
  end
end
