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
    league_id = @league.id
    
    if params[:season_id].blank?
      @teams = ''
    else
      season_id = params[:season_id]
      @teams = Team.find_by_league_and_season(league_id, season_id).as_json
    end
  end
  
  def create_teams
    @mt = "Save teams for #{@league.league_name}"
    league_id = @league.id
    season_id = params[:season_id]
    team_ids = params[:team_ids]
    team_ids = team_ids.split(",")
    
    teams = Team.find_by_league_and_season(league_id, season_id)
    current_team_ids = Array.new
    teams.each do |team|
      current_team_ids.push(team.id.to_s)  
    end
    
    AssignTeam.update_master(league_id, season_id, team_ids, current_team_ids) 
    
    flash[:success] = "Save teams for #{@league.league_name} successfully!"
    redirect_to new_teams_league_path(@league) + "?season_id=#{season_id}"
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