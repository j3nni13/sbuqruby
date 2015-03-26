class CreateVenuetypes < ActiveRecord::Migration
  def change
    create_table :venuetypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
