class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.integer :department_id
      t.integer :rent

      t.timestamps
    end
  end
end
