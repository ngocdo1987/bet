class CreateOddSpreads < ActiveRecord::Migration
  def change
    create_table :odd_spreads do |t|
      t.integer :match_id
      t.float :home_hdc
      t.float :away_hdc
      t.float :home_odd
      t.float :away_odd
      t.timestamps
    end
    
    add_index :odd_spreads, :match_id
  end
end
