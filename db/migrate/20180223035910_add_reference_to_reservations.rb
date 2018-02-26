class AddReferenceToReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :user_id
    remove_column :reservations, :listing_id

    add_reference :reservations, :user, foreign_key: true, index: true
    add_reference :reservations, :listing, foreign_key: true, index: true
  end
end
