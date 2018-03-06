class RenameColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :reservations, :price, :total_price
  end
end
