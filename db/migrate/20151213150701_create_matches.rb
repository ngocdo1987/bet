class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :league_id
      t.string :home_team
      t.string :away_team
      t.integer :home_number, :limit => 3
      t.integer :away_number, :limit => 3
      t.integer :home_score, :limit => 1
      t.integer :away_score, :limit => 1
      t.datetime :match_time
      t.string :status
      t.boolean :calculated
      t.boolean :active
      t.timestamps
    end
    
    add_index :matches, :league_id
  end
end
