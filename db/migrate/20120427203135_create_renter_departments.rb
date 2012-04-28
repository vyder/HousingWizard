class CreateRenterDepartments < ActiveRecord::Migration
  def change
    create_table :renter_departments do |t|
      t.integer :department_id
      t.integer :renter_id

      t.timestamps
    end
  end
end
