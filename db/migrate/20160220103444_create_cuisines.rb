class CreateCuisines < ActiveRecord::Migration
  def change
    create_table :cuisines do |t|
      t.string :name
      t.string :slug
      t.string :description
      t.timestamps
    end
  end
end
