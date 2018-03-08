class AmendCountryDatatype < ActiveRecord::Migration[5.1]
  def change
     remove_column :listings, :country

     add_column :listings, :country, :string    
  end
end
