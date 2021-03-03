class ChangeTypeToSocialTypeInBandSocials < ActiveRecord::Migration[6.1]
  def change
    rename_column :band_socials, :type, :social_type
  end
end
