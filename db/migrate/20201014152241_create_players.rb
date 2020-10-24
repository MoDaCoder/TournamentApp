class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :player_number
      t.boolean :starter, default: false
      t.timestamps
    end
  end
end
