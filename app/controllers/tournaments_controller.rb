class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.create(tournament_params)

    if @tournament.new_record?
      render "new"
    else
      redirect_to tournament_path(@tournament)
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def update
    tournament_params
    @tournament = Tournament.find(params[:id])

    if @tournament.update(tournament_params)
      redirect_to @tournament
    else
      render "edit"
    end
  end

  def destroy
    tournament = Tournament.find(params[:id])
    tournament.destroy

    redirect_to tournaments_path
  end

  def start
    tournament = Tournament.find(params[:id])
    tournament.update(status: "Started")
    redirect_to tournament_path(tournament)
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name,:city,:start_date,:end_date,team_ids: [])
  end
end
