class RemoveColumnFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :booking_id, :references
  end
end
