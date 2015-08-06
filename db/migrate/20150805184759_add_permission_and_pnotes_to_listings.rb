class AddPermissionAndPnotesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :permission, :boolean
    add_column :listings, :pnotes, :text
  end
end
