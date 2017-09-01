class CreateJoinTableTeamsTournaments < ActiveRecord::Migration[5.1]
  def change
    create_join_table :teams, :tournaments do |t|
      t.index [:team_id, :tournament_id]
      t.index :tournament_id
    end
  end
end
