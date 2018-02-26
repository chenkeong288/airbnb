class AddReferenceToListing < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :user_id

    add_reference :listings, :user, foreign_key: true, index: true
  end
end
