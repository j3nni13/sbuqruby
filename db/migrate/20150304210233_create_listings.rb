class CreateListings < ActiveRecord::Migration

  def change
    create_table :listings do |t|
      t.string :title
      t.string :location
      t.string :contactname
      t.string :contacttitle
      t.string :phonenumber
      t.string :email
      t.integer :mincapacity
      t.integer :maxcapacity
      t.string :venuetype
      t.string :eventtype
      t.integer :price
      t.text :description
      t.string :amenities
      t.string :parking
      t.string :food
      t.string :alcohol
      t.string :audiovisual
      t.string :reception
      

      t.timestamps null: false
    end
  end
end
