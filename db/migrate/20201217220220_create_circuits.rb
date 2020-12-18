class CreateCircuits < ActiveRecord::Migration[6.0]
  def change
    create_table :circuits do |t|
      t.string :name
      t.string :city

      t.timestamps
    end
  end
end
