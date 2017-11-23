class AddDefaultToBookings < ActiveRecord::Migration[5.1]

  def change
    change_column :bookings, :accepting, :boolean, default: true

  end
end
