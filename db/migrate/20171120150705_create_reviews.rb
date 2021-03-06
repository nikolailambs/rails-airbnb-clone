class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true
      t.integer :rating
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
