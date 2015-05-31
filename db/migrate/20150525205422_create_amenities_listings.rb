class CreateAmenitiesListings < ActiveRecord::Migration
  def change
    create_table :amenities_listings do |t|
    t.belongs_to :amenities
      t.belongs_to :listings
      t.integer :amenity_id
      t.integer :listing_id
      t.timestamps null: false
    end
  end
end
