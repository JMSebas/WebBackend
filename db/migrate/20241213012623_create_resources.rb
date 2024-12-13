class CreateResources < ActiveRecord::Migration[7.2]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :type
      t.string :url
      t.references :assignment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
