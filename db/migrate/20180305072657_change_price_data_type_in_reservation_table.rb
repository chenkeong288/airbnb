class ChangePriceDataTypeInReservationTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :price 

    add_column :reservations, :price, :float
  end
end
