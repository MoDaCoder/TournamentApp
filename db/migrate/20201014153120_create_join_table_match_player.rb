class CreateJoinTableMatchPlayer < ActiveRecord::Migration[6.0]
  def change
    create_join_table :matches, :players do |t|
      # t.index [:match_id, :player_id]
      # t.index [:player_id, :match_id]
    end
  end
end
