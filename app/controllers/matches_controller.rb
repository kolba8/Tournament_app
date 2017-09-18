class MatchesController < ApplicationController
  def new
    @tournament = Tournament.find(params[:tournament_id])
    @match = Match.new(tournament_id: @tournament.id)
  end

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @match = @tournament.matches.new(match_params)

    if @match.save
      if (@tournament.matches.count == @tournament.teams.count * (@tournament.teams.count - 1) / 2)
         @tournament.update(status: "Finished")
      end
      redirect_to tournament_path(@tournament)
    else
      render "new"
    end
  end

  def edit
    @tournament = Tournament.find(params[:tournament_id])
    @match = Match.new(tournament_id: @tournament.id)
  end

  private

  def match_params
    params.require(:match).permit(:team1_id,:team2_id,:team1_score,:team2_score)
  end
end
