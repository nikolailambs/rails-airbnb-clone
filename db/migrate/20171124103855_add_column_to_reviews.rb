class AddColumnToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :office, foreign_key: true
  end
end
