class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.date :date
      t.string :location
      t.float :latitude
      t.float :longitude
      t.references :band, null: false, foreign_key: true

      t.timestamps
    end
  end
end
