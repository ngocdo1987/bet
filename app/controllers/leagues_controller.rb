class LeaguesController < ApplicationController
  load_and_authorize_resource
  before_action :set_league, only: [:show, :edit, :update, :destroy, :new_teams, :create_teams]
  require './lib/ar'
    
  def index
    @leagues = Ar.search(League, params)
    @mt = 'List leagues'
  end
    
  def show
    @mt = "Show #{@league.league_name}"
  end
    
  def new
    @league = League.new
    @mt = 'Create league'
  end

  def create
    @league = League.new(league_params)
    @mt = 'Create league'
    if @league.save
      flash[:success] = 'Your league was created successfully!'
      redirect_to leagues_path
    else
      render :new        
    end
  end
    
  def edit
    @mt = "Edit #{@league.league_name}"
  end
    
  def update
    @mt = "Edit #{@league.league_name}"
    if @league.update(league_params)
      flash[:success] = 'Your league was updated successfully!'
      redirect_to league_path(@league)
    else
      render :edit     
    end
  end
    
  def destroy
    @league.destroy
    flash[:success] = 'Your league was deleted successfully!'
    redirect_to leagues_path
  end
  
  def new_teams
    @mt = "Save teams for #{@league.league_name}"
    @seasons = Season.all
    #@teams = Team.select('id, name').as_json
  end
  
  def create_teams
    @mt = "Save teams for #{@league.league_name}"
    league_id = params[:league_id]
    season_id = params[:season_id]
    team_ids = params[:team_ids]
    team_ids = team_ids.split(",")
    
    team_ids.each do |team_id|
      @assign_team = AssignTeam.new(league_id: league_id, season_id: season_id, team_id: team_id)
      @assign_team.save
    end
    
    redirect_to new_teams_league_path(@league)
  end
    
  private
    def set_league
      @league = League.find(params[:id])            
    end
        
    def league_params
      params.require(:league).permit(:league_name, :league_image, :league_type, :active)        
    end
    
    def assign_team_params
      params.permit(:league_id, :season_id, :team_ids)
    end
end