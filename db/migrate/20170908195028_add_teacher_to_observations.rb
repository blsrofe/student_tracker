class AddTeacherToObservations < ActiveRecord::Migration[5.1]
  def change
    add_column :observations, :teacher, :string
  end
end
