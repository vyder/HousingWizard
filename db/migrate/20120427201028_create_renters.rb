class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.boolean :roommate
      t.boolean :oncampus
      t.integer :rent
      t.string :notes

      t.timestamps
    end
  end
end
