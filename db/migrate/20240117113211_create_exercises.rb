class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.references :session, null: false, foreign_key: true
      t.string :machine
      t.time :duration
      t.integer :weight
      t.integer :repetition
      t.integer :serie

      t.timestamps
    end
  end
end
