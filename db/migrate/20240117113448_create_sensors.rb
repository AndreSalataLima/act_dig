class CreateSensors < ActiveRecord::Migration[7.1]
  def change
    create_table :sensors do |t|
      t.references :exercise, null: false, foreign_key: true
      t.float :distance
      t.float :speed
      t.time :time

      t.timestamps
    end
  end
end
