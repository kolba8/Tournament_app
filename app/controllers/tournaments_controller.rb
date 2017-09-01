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

  private

  def tournament_params
    params.require(:tournament).permit(:name,:cite,:start_date,:end_date)
  end
end
