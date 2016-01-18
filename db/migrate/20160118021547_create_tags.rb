class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :slug
      t.string :ancestry

      t.timestamps null: false
    end
    add_index :tags, :ancestry
  end
end
