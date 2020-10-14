class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :match_number
      t.date :match_date
      t.integer :user_id
      t.timestamps
    end
  end
end
