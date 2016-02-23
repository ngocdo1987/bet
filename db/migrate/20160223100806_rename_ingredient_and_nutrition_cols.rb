class RenameIngredientAndNutritionCols < ActiveRecord::Migration
  def change
    rename_column :ingredients, :name, :ingredient_name
    rename_column :nutritions, :name, :nutrition_name
    rename_column :nutritions, :weight, :nutrition_weight
  end
end
