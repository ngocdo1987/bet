class AddMoreColsForAssignTeams < ActiveRecord::Migration
  def change
    add_column :assign_teams, :games_played, :integer, :limit => 1
    add_column :assign_teams, :win, :integer, :limit => 1
    add_column :assign_teams, :draw, :integer, :limit => 1
    add_column :assign_teams, :lose, :integer, :limit => 1
    add_column :assign_teams, :goals_for, :integer, :limit => 1
    add_column :assign_teams, :goals_against, :integer, :limit => 1
    add_column :assign_teams, :points, :integer, :limit => 1
  end
end
