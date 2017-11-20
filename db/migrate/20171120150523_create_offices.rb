class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.references :user, foreign_key: true
      t.string :size
      t.string :address
      t.boolean :availability
      t.string :city
      t.string :type
      t.integer :price_per_hour
      t.integer :price_per_day
      t.integer :price_per_week
      t.integer :price_per_month
      t.string :description
      t.string :facility_standard
      t.string :pictures
      t.date :available_from
      t.date :available_to
      t.string :schedule

      t.timestamps
    end
  end
end
