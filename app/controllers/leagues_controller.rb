class LeaguesController < ApplicationController
    def index
        @leagues = League.search(params)
        @mt = 'List leagues'
    end
    
    def show
        @league = League.find(params[:id])
        @mt = 'Show ' + @league.league_name
    end
    
    def new
        @league = League.new
        @mt = 'Create league'
    end

    def create
        @league = League.new(league_params)
        @mt = 'Create league'
        if @league.save
            flash[:success] = "Your league was created successfully!"
            redirect_to leagues_path
        else
            render :new        
        end
    end
    
    def edit
        @league = League.find(params[:id])
        @mt = 'Edit ' + @league.league_name
    end
    
    def update
        @league = League.find(params[:id])
        @mt = 'Edit ' + @league.league_name
        if @league.update(league_params)
            flash[:success] = "Your league was updated successfully!"
            redirect_to league_path(@league)
        else
            render :edit     
        end
    end
    
    private
        def league_params
            params.require(:league).permit(:league_name, :league_image, :league_type, :active)        
        end
end