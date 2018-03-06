class AddPaymentStatusIntoReservationsListingWithDefaultValue < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :payment_status

    add_column :reservations, :payment_status, :string, :default => "No"
  end
end
