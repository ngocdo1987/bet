class TeamsController < ApplicationController
  load_and_authorize_resource
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_leagues, only: [:index, :new, :create, :edit, :update]
  require './lib/ar'
    
  def index
    @teams = Ar.search(Team, params)
    @mt = 'List teams'
  end
  
  def search
    league_id = params[:league_id]
    season_id = params[:season_id]
    
    @teams = AssignTeam.select('teams.name, teams.id').joins(:team).where('assign_teams.league_id = ? AND assign_teams.season_id = ?', league_id, season_id)
  end
    
  def show
    @mt = "Show #{@team.name}"
  end
    
  def new
    @team = Team.new
    @mt = 'Create team'
  end
    
  def create
    @team = Team.new(team_params)
    @mt = 'Create team'
    
    if @team.save
      flash[:success] = 'Your team was created successfully!'
      redirect_to teams_path
    else
      render :new    
    end
  end
    
  def edit
    @mt = "Edit #{@team.name}"
  end
    
  def update
    @mt = "Edit #{@team.name}"
    
    if @team.update(team_params)
      flash[:success] = 'Your team was updated successfully!' 
      redirect_to team_path(@team)
    else
      render :edit        
    end
  end
    
  def destroy
    @team.destroy
    flash[:success] = 'Your team was updated successfully!'
    redirect_to teams_path
  end
    
  private
    def set_team
      @team = Team.find(params[:id])        
    end
    
    def set_leagues
      @leagues = League.all
    end
    
    def team_params
      params.require(:team).permit(:name, :image, :description)        
    end
end