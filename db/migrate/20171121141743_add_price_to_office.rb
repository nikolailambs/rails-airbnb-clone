class AddPriceToOffice < ActiveRecord::Migration[5.1]
  def change
    add_column :offices, :price, :integer
    add_column :offices, :period, :string
  end
end
