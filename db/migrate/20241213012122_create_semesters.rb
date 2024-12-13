class CreateSemesters < ActiveRecord::Migration[7.2]
  def change
    create_table :semesters do |t|
      t.string :name
      t.string :uuid_user

      t.timestamps
    end
  end
end
