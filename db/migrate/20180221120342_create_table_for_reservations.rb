class CreateTableForReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :table_for_reservations do |t|
      t.string :start_date
      t.string :end_date
      t.string :price
      t.string :listing_id
      t.string :user_id
    end
  end
end
