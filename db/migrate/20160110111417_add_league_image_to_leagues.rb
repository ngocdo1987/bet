class AddLeagueImageToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :league_image, :string    
  end
end
