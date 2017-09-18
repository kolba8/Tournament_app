class AddGamesPlayedAndSetsWonAndSetsLostAndSetsDifferenceAndPointsToTeamsTournaments < ActiveRecord::Migration[5.1]
  def change
    add_column :teams_tournaments, :games_played, :integer, default: 0
    add_column :teams_tournaments, :sets_won, :integer, default: 0
    add_column :teams_tournaments, :sets_lost, :integer, default: 0
    add_column :teams_tournaments, :sets_difference, :integer, default: 0
    add_column :teams_tournaments, :points, :integer, default: 0
  end
end
