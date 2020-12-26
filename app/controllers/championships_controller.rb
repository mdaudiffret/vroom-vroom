class ChampionshipsController < ApplicationController

  def new
    @team = Team.find(params[:team_id])
    @championship = Championship.new()
    authorize @championship
  end

  def create
    @championship = Championship.new(championship_params)
    authorize @championship
    @team = Team.find(params[:team_id])
    @team.championship = @championship
    if @championship.save! && @team.save!
      @championship.sharing_code = "#{@team.name.first}#{@championship.name.first}#{@championship.id}"
      @championship.save
      flash[:notice] = "Championat créé"
      redirect_to teams_path
    else
      flash[:notice] = "Il y a eu un problème"
      redirect_to teams_path
    end
  end


  private
  def championship_params
    params.require(:championship).permit(
      :name,
      :participants_number,
      :race_number,
      :team
    )
  end
end
