class CreateListingsReceptions < ActiveRecord::Migration
  def change
    create_table :listings_receptions do |t|
      t.belongs_to :receptions
      t.belongs_to :listings
      t.integer :reception_id
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
