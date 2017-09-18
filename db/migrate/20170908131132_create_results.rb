class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|

      t.integer :tournament_id
      t.integer :team_id
      t.integer :sets_won
      t.integer :sets_lost
      t.integer :sets_difference
      t.integer :points
      t.timestamps
    end

    add_foreign_key :results, :tournaments, column: :tournament_id
    add_foreign_key :results, :teams, column: :team_id
  end
end
