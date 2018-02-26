class RemoveIntegerDescription < ActiveRecord::Migration[5.1]
  def change
  	remove_column :listings, :description
  end
end
