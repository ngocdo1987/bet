class CreateBetMoneyLines < ActiveRecord::Migration
  def change
    create_table :bet_money_lines do |t|
      t.integer :user_id
      t.integer :odd_id
      t.integer :match_id
      t.float :stake
      t.float :profit
      t.string :option
      t.string :result
      t.timestamps
    end
    
    add_index :bet_money_lines, :user_id
    add_index :bet_money_lines, :odd_id
    add_index :bet_money_lines, :match_id
  end
end
