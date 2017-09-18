class AddTeam1PointsAndTeam2PointsToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :team1_points, :integer, default: 0
    add_column :matches, :team2_points, :integer, default: 0
  end
end
