class CreateListingsParkings < ActiveRecord::Migration
  def change
    create_table :listings_parkings do |t|
      t.belongs_to :parkings
      t.belongs_to :listings
      t.integer :parking_id
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
