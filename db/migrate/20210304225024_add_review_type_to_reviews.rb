class AddReviewTypeToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :review_type, :string, default: "host"
  end
end
