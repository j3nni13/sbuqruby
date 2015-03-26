class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.text :description
      

      t.timestamps null: false
    end
  end
end
