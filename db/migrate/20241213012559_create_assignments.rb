class CreateAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.string :status
      t.float :grade
      t.text :feedback
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
