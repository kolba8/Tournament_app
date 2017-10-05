class AddGamesWonAndGamesLostToResults < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :games_won, :integer, default: 0
    add_column :results, :games_lost, :integer, default: 0
  end
end
