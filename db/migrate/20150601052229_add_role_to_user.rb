class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :venuemanager, :boolean, :default => false
    add_column :users, :date_of_birth, :datetime
    add_column :users, :gender, :string
  end
end
