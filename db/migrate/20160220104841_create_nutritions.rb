class CreateNutritions < ActiveRecord::Migration
  def change
    create_table :nutritions do |t|
      t.integer :recipe_id
      t.string :name
      t.string :weight
      t.timestamps
    end
    
    add_index :nutritions, :recipe_id
    
    add_index :ingredients, :recipe_id
  end
end
