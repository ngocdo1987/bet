class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
