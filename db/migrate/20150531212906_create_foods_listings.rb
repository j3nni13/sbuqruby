class CreateFoodsListings < ActiveRecord::Migration
  def change
    create_table :foods_listings do |t|
    	t.belongs_to :foods
    	t.belongs_to :listings
      	t.integer :food_id
      	t.integer :listing_id

      t.timestamps null: false
    end
  end
end
