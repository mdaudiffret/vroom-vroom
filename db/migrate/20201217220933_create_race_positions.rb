class CreateRacePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :race_positions do |t|
      t.integer :quali_position
      t.integer :race_position
      t.time :race_time
      t.boolean :best_lap
      t.references :driver, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true

      t.timestamps
    end
  end
end
