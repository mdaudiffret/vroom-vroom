class TeamsController < ApplicationController
  def index
    @teams = policy_scope(Team)
    @team = Team.new()
    @logos = logos
    # raise
  end

  def create
    @team = current_user.teams.new(team_params)
    @team.budget = 200_000
    @team.points = 0
    @team.championship = Championship.first
    authorize @team
    if @team.save!
      flash[:notice] = "Ecurie crée"
      redirect_to teams_path
    else
      flash[:notice] = "Il y a eu un problème"
      redirect_to teams_path
    end
  end

  def join_championship
    @team = Team.find(params[:id])
    authorize @team
  end

  def update
    @team = Team.find(params[:id])
    authorize @team
    @team.sharing_code = team_params[:sharing_code]
    @team.championship = Championship.find_by(sharing_code: @team.sharing_code)
    if @team.save!
      flash[:notice] = "Ecurie mise à jour"
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
      :sharing_code,
      :color
    )
  end

  def logos
    {
      cheval: 'fas fa-horse',
      chapeau: 'fas fa-hat-cowboy',
      reine: 'fas fa-chess-queen',
      eclair: 'fas fa-bolt',
      chevrons: 'fas fa-angle-double-down',
      pomme: 'fas fa-apple-alt',
      dragon: 'fas fa-dragon',
      colombe: 'fas fa-dove',
      hyppo: 'fas fa-hippo',
      kiwi: 'fas fa-kiwi-bird'

    }
  end

end
