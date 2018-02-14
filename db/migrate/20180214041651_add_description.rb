class AddDescription < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :description, :integer
  end
end
