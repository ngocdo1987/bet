class MatchesController < ApplicationController
    def index
        @matches = Match.paginate(page: params[:page], per_page: 20)   
    end
   
    def show
        @match = Match.find(params[:id])   
    end
    
    def new
        @match = Match.new
        @leagues = League.all
        @odd_spread = OddSpread.new
        @odd_money_line = OddMoneyLine.new
        @odd_total_point = OddTotalPoint.new
    end
   
    def create
        @match = Match.new(match_params)
        @leagues = League.all
        @odd_spread = OddSpread.new
        @odd_money_line = OddMoneyLine.new
        @odd_total_point = OddTotalPoint.new
        
        if @match.save
            flash[:success] = "Your match was created successfully!"
            redirect_to matches_path
        else
            render :new
        end
    end
   
    def edit
        @match = Match.find(params[:id])
        @leagues = League.all
        @odd_spread = OddSpread.new
        @odd_money_line = OddMoneyLine.new
        @odd_total_point = OddTotalPoint.new
    end
   
    def update
        @match = Match.find(params[:id])
        @leagues = League.all
        @odd_spread = OddSpread.new
        @odd_money_line = OddMoneyLine.new
        @odd_total_point = OddTotalPoint.new
        
        if @match.update(match_params)
            flash[:success] = "Your match was updated successfully!"
            redirect_to match_path(@match)
        else
            render :edit        
        end
    end
   
    private
        def match_params
            params.require(:match).permit(:league_id, :home_team, :away_team, :home_number, :away_number, :home_score, :away_score, :match_time, :status, :calculated, :active)
        end    
           
    
end