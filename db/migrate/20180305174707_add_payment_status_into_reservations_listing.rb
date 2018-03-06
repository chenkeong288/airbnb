class AddPaymentStatusIntoReservationsListing < ActiveRecord::Migration[5.1]
  def change
     add_column :reservations, :payment_status, :string
  end
end
