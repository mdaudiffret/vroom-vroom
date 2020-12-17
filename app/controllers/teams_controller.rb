class TeamsController < ApplicationController
  def index
    @teams = policy_scope(Team)
    @team = Team.new()
  end

  def create
    @team = current_user.teams.new(team_params)
    if @team.sharing_code
      @team.championship = Championship.find(sharing_code: @team.sharing_code)
    else
      @team.championship = Championship.new()
    end
    @team.budget = 200_000
    @team.points = 0
    authorize @team
    if @team.save!
      flash[:notice] = "Ecurie crée"
      redirect_to teams_path
    else
      flash[:notice] = "Il y a eu un problème"
      redirect_to teams_path
    end
  end

  private

  def team_params
    params.require(:team).permit(
      :name,
      :logo,
      :color
    )
  end
end
