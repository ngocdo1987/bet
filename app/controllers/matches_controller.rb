class MatchesController < ApplicationController
  load_and_authorize_resource
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :set_leagues, only: [:index, :new, :create, :edit, :update]
  before_action :set_odd, only: [:new, :edit]
  require './lib/ar'
    
  def index
    @matches = Ar.search(Match, params)
    @mt = 'List matches'
  end
   
  def show
    @mt = "Show #{@match.home_team} vs #{@match.away_team}"
  end
    
  def new
    @match = Match.new
    @mt = 'Create match'
  end
   
  def create
    @match = Match.new(match_params)
    @mt = 'Create match'
        
    if @match.save
      @odd_spread = OddSpread.new(odd_spread_params[:odd_spreads])
      @odd_spread.match = @match
      @odd_spread.save
      
      @odd_money_line = OddMoneyLine.new(odd_money_line_params[:odd_money_lines])
      @odd_money_line.match = @match
      @odd_money_line.save
      
      @odd_total_point = OddTotalPoint.new(odd_total_point_params[:odd_total_points])
      @odd_total_point.match = @match
      @odd_total_point.save
          
      flash[:success] = 'Your match was created successfully!'
      redirect_to matches_path
    else
      render :new
    end
  end
   
  def edit
    @odd_spreads = @match.odd_spreads.order(created_at: :desc)
    @odd_money_lines = @match.odd_money_lines.order(created_at: :desc)
    @odd_total_points = @match.odd_total_points.order(created_at: :desc)
    @mt = "Edit #{@match.home_team} vs #{@match.away_team}"
  end
   
  def update
    @mt = "Edit #{@match.home_team} vs #{@match.away_team}"
    
    if @match.update(match_params)
      @odd_spread = OddSpread.new(odd_spread_params[:odd_spreads])
      @odd_spread.match = @match
      @odd_spread.save
      
      @odd_money_line = OddMoneyLine.new(odd_money_line_params[:odd_money_lines])
      @odd_money_line.match = @match
      @odd_money_line.save
      
      @odd_total_point = OddTotalPoint.new(odd_total_point_params[:odd_total_points])
      @odd_total_point.match = @match
      @odd_total_point.save
      
      flash[:success] = 'Your match was updated successfully!'
      redirect_to match_path(@match)
    else
      render :edit        
    end
  end
    
  def destroy
    @match.destroy
    flash[:success] = 'Your match was deleted successfully!'
    redirect_to matches_path
  end
   
  private
    def set_match
      @match = Match.find(params[:id])              
    end
    
    def set_leagues
      @leagues = League.all             
    end
        
    def set_odd
      @odd_spread = OddSpread.new
      @odd_money_line = OddMoneyLine.new
      @odd_total_point = OddTotalPoint.new            
    end
        
    def match_params
      params.require(:match).permit(:league_id, :home_team, :away_team, :home_number, :away_number, :home_score, :away_score, :match_time, :status, :calculated, :active)
    end  
    
    def odd_spread_params
      params.require(:match).permit(odd_spreads: [:home_hdc, :away_hdc, :home_odd, :away_odd])    
    end
    
    def odd_money_line_params
      params.require(:match).permit(odd_money_lines: [:home_odd, :away_odd])
    end
    
    def odd_total_point_params
      params.require(:match).permit(odd_total_points: [:over_hdc, :under_hdc, :over_odd, :under_odd])    
    end
        
end