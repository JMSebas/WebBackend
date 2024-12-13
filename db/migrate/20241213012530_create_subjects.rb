class CreateSubjects < ActiveRecord::Migration[7.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :professor
      t.integer :credits
      t.string :status
      t.float :final_grade
      t.references :semester, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
