class CreateeventtypesListings < ActiveRecord::Migration
  def change
    create_table :eventtypes_listings do |t|
      t.belongs_to :eventtypes
      t.belongs_to :listings
      t.integer :eventtype_id
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
