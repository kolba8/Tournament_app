class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|

      t.integer :tournament_id
      t.integer :team1_id
      t.integer :team2_id
      t.integer :team1_score
      t.integer :team2_score
      t.timestamps
    end

    add_foreign_key :matches, :tournaments, column: :tournament_id
    add_foreign_key :matches, :teams, column: :team1_id
    add_foreign_key :matches, :teams, column: :team2_id
  end
end
