class AddSeasonIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :season_id, :integer
    add_index :matches, :season_id
  end
end
