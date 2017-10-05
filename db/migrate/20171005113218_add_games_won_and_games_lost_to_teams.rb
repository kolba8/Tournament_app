class AddGamesWonAndGamesLostToTeams < ActiveRecord::Migration[5.1]
  def change
      add_column :teams, :games_won, :integer, default: 0
      add_column :teams, :games_lost, :integer, default: 0
  end
end
