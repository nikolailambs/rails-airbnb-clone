class AddColumnToOffices < ActiveRecord::Migration[5.1]
  def change
    add_column :offices, :name, :string
  end
end
