class CreateAlcoholsListings < ActiveRecord::Migration
  def change
    create_table :alcohols_listings do |t|
      t.belongs_to :alcohols
      t.belongs_to :listings
      t.integer :alcohol_id
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
