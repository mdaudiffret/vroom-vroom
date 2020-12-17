class CreateChampionships < ActiveRecord::Migration[6.0]
  def change
    create_table :championships do |t|
      t.string :name
      t.string :sharing_code
      t.integer :participants_number
      t.integer :race_number

      t.timestamps
    end
  end
end
