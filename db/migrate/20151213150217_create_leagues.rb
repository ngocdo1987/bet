class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :league_name
      t.string :league_type
      t.boolean :active
      t.timestamps
    end
  end
end
