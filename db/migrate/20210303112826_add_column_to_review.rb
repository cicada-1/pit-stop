class AddColumnToReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :room, null: false, foreign_key: true
    add_reference :reviews, :band, null: false, foreign_key: true
  end
end
