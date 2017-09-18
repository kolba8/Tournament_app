class Match < ApplicationRecord
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"
  belongs_to :tournament

  validate :must_be_two_different_teams
  validate :must_be_correct_score
  validate :must_be_unique

  after_validation :set_points
  after_validation :update_table

  def must_be_two_different_teams
    if team1_id == team2_id
      errors.add(:team2_id, "must be a different teams")
    end
  end

  def must_be_correct_score
    if !((team1_score == 3 && team2_score != 3) || (team1_score != 3 && team2_score == 3))
      errors.add(:base ,"this score is incorrect")
    end
  end

  def must_be_unique
    if Match.all.where(tournament_id: tournament_id).where(team1_id: team1_id, team2_id: team2_id).count != 0
      errors.add(:base ,"this match isn't unique")
    elsif Match.all.where(tournament_id: tournament_id).where(team1_id: team2_id, team2_id: team1_id).count != 0
      errors.add(:base ,"this match isn't unique")
    end
  end

  def set_points
    if self.team1_score == 3
      if self.team2_score == 2
        self.team1_points = 2
        self.team2_points = 1
      else
        self.team1_points = 3
      end
    elsif self.team1_score == 2
      self.team1_points = 1
      self.team2_points = 2
    else
      self.team2_points = 3
    end
  end

  def update_table
    team1.tournaments.update(games_played: 1)
  end
end
