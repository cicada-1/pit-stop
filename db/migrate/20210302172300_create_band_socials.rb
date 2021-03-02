class CreateBandSocials < ActiveRecord::Migration[6.1]
  def change
    create_table :band_socials do |t|
      t.string :type
      t.string :profile_url
      t.references :band, null: false, foreign_key: true

      t.timestamps
    end
  end
end
