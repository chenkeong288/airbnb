class AddReservationsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :reservations
    drop_table :table_for_reservations
    create_table :reservations do |t|
      t.string :start_date
      t.string :end_date
      t.string :price
      t.string :listing_id
      t.string :user_id
    end
  end
end
