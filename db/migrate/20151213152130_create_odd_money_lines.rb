class CreateOddMoneyLines < ActiveRecord::Migration
  def change
    create_table :odd_money_lines do |t|
      t.integer :match_id
      t.float :home_odd
      t.float :away_odd
      t.timestamps
    end
    
    add_index :odd_money_lines, :match_id
  end
end
