class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :office, foreign_key: true
      t.date :date_from
      t.date :date_to
      t.integer :number_people
      t.boolean :accepting
      t.string :note

      t.timestamps
    end
  end
end
