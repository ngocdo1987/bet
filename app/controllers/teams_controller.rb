class TeamsController < ApplicationController
    require './lib/ar'
    
    def index
        @teams = Ar.search(Team, params)
        @leagues = League.all
        @mt = "List teams"
    end
    
    def show
        @team = Team.find(params[:id])    
        @mt = "Show #{@team.name}"
    end
    
    def new
        @team = Team.new
        @leagues = League.all
        @mt = "Create team"
    end
    
    def create
        @team = Team.new(team_params)
        @leagues = League.all
        @mt = "Create team"
        
        if @team.save
            flash[:success] = "Your team was created successfully!"
            redirect_to teams_path
        else
            render :new    
        end
    end
    
    def edit
        @team = Team.find(params[:id])
        @leagues = League.all
        @mt = "Edit #{@team.name}"
    end
    
    def update
        @team = Team.find(params[:id])
        @leagues = League.all
        @mt = "Edit #{@team.name}"
        
        if @team.update(team_params)
            flash[:success] = "Your team was updated successfully!"    
        else
            render :edit        
        end
    end
    
    private
        def team_params
            params.require(:team).permit(:name, :image, :description, :total_matches, :total_points, :league_id)        
        end
end