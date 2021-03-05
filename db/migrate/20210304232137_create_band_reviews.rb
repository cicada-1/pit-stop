class CreateBandReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :band_reviews do |t|
      t.text :content
      t.references :room, null: false, foreign_key: true
      t.references :band, null: false, foreign_key: true

      t.timestamps
    end
  end
end
