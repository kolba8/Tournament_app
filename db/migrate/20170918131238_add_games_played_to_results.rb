class AddGamesPlayedToResults < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :games_played, :integer
  end
end
