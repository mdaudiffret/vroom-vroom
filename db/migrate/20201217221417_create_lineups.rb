class CreateLineups < ActiveRecord::Migration[6.0]
  def change
    create_table :lineups do |t|
      t.integer :budget
      t.integer :points
      t.references :driver, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true

      t.timestamps
    end
  end
end
