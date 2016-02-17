class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :slug
      t.string :image
      t.text :description
      t.text :content
      t.timestamps
    end
  end
end
