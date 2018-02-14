class AddDescriptionString < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :description, :string
  end
end
