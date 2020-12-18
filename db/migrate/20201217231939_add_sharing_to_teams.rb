class AddSharingToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :sharing_code, :string
  end
end
