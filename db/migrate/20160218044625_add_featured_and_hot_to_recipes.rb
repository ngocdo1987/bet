class AddFeaturedAndHotToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :featured, :boolean
    add_column :recipes, :hot, :boolean
  end
end
