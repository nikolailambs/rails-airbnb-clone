class ChangeTypeFromOffices < ActiveRecord::Migration[5.1]
  def change
    change_column :offices, :description, :text
  end
end
