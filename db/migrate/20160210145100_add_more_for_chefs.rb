class AddMoreForChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :position, :string
    add_column :chefs, :description, :text
    add_column :chefs, :facebook, :string
    add_column :chefs, :twitter, :string
    add_column :chefs, :linkedin, :string
    add_column :chefs, :gplus, :string
  end
end
