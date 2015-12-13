class CreateOddTotalPoints < ActiveRecord::Migration
  def change
    create_table :odd_total_points do |t|
      t.integer :match_id
      t.float :over_hdc
      t.float :under_hdc
      t.float :over_odd
      t.float :under_odd
      t.timestamps
    end
    
    add_index :odd_total_points, :match_id
  end
end
