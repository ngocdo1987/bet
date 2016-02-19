class AddHomeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :home, :boolean
  end
end
