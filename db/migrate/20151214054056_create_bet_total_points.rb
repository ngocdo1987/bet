class CreateBetTotalPoints < ActiveRecord::Migration
  def change
    create_table :bet_total_points do |t|
      t.integer :user_id
      t.integer :odd_id
      t.integer :match_id
      t.float :stake
      t.float :profit
      t.string :option
      t.string :result
      t.timestamps
    end
    
    add_index :bet_total_points, :user_id
    add_index :bet_total_points, :odd_id
    add_index :bet_total_points, :match_id
  end
end
