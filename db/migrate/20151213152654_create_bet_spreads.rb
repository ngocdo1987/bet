class CreateBetSpreads < ActiveRecord::Migration
  def change
    create_table :bet_spreads do |t|
      t.integer :user_id
      t.integer :odd_id
      t.integer :match_id
      t.float :stake
      t.float :profit
      t.string :option
      t.string :result
      t.timestamps
    end
    
    add_index :bet_spreads, :user_id
    add_index :bet_spreads, :odd_id
    add_index :bet_spreads, :match_id
  end
end
