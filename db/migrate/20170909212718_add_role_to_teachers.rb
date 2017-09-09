class AddRoleToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :role, :integer, default: 0
  end
end
