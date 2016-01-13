class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :image
      t.string :description
      t.integer :total_matches
      t.integer :total_points
      t.timestamps
    end
  end
end
