class AddTotalNumberOfDaysColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :number_of_days, :integer
  end
end
