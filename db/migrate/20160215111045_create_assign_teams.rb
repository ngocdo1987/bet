class CreateAssignTeams < ActiveRecord::Migration
  def change
    create_table :assign_teams do |t|
      t.integer :league_id
      t.integer :season_id
      t.integer :team_id
    end
    
    add_index :assign_teams, [:league_id, :season_id, :team_id], unique: true
  end
end
