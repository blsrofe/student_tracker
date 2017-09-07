class CreateSectionStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :section_students do |t|
      t.references :student, foreign_key: true
      t.references :section, foreign_key: true
    end
  end
end
