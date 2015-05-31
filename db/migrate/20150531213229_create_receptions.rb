class CreateReceptions < ActiveRecord::Migration
  def change
    create_table :receptions do |t|
		t.string :name
      t.timestamps null: false
    end
  end
end
