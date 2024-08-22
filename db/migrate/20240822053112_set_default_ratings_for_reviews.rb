class SetDefaultRatingsForReviews < ActiveRecord::Migration[7.1]
  def change
    change_column_default :reviews, :ratings, 0
  end
end
