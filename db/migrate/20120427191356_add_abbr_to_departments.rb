class AddAbbrToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :abbr, :string
  end
end
