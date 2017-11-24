class RemoveNoteFromBooking < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :note, :string
  end
end
