class LeaguesController < ApplicationController
    def index
        @leagues = League.paginate(page: params[:page], per_page: 10)
    end
    
    def show
        @league = League.find(params[:id])
    end
    
    def new
        @league = League.new
    end

    def create
        @league = League.new(league_params)
        if @league.save
            flash[:success] = "Your league was created successfully!"
            redirect_to leagues_path
        else
            render :new        
        end
    end
    
    def edit
        @league = League.find(params[:id])
    end
    
    def update
        @league = League.find(params[:id])
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