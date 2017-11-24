class AddDefaultToOffices < ActiveRecord::Migration[5.1]
  def change
    change_column :offices, :availability, :boolean, default: true
  end
end
