class AddCuisineIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :cuisine_id, :integer
    add_index :recipes, :cuisine_id
  end
end
