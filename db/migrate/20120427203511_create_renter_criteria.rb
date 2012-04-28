class CreateRenterCriteria < ActiveRecord::Migration
  def change
    create_table :renter_criteria do |t|
      t.integer :criterium_id
      t.integer :renter_id

      t.timestamps
    end
  end
end
