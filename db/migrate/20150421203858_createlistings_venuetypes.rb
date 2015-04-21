class CreatelistingsVenuetypes < ActiveRecord::Migration
  def change
    create_table :listings_venuetypes do |t|
      t.belongs_to :venuetypes
      t.belongs_to :listings
      t.integer :venuetype_id
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end

