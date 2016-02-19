class AddHomeToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :home, :boolean
  end
end
