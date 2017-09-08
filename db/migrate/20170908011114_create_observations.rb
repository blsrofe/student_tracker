class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.date :date
      t.text :content
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
