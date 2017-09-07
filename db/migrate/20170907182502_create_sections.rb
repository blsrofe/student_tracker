class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :name
      t.references :teacher, foreign_key: true
    end
  end
end
