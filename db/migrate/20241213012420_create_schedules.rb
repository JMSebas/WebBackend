class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules do |t|
      t.string :day
      t.string :time

      t.timestamps
    end
  end
end
