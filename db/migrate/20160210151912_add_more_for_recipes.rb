class AddMoreForRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredients, :text
    add_column :recipes, :steps, :text
    add_column :recipes, :cooking_time, :string
    add_column :recipes, :level, :string
  end
end
