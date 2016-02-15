class SeasonsController < ApplicationController
  load_and_authorize_resource
  before_action :set_season, only: [:show, :edit, :update, :destroy]
  require './lib/ar'
    
  def index
    @seasons = Ar.search(Season, params)
    @mt = 'List seasons'
  end
    
  def show
    @mt = "Show #{@season.name}"
  end
    
  def new
    @season = Season.new
    @mt = 'Create season'
  end

  def create
    @season = Season.new(season_params)
    @mt = 'Create season'
    if @season.save
      flash[:success] = 'Your season was created successfully!'
      redirect_to seasons_path
    else
      render :new        
    end
  end
    
  def edit
    @mt = "Edit #{@season.name}"
  end
    
  def update
    @mt = "Edit #{@season.name}"
    if @season.update(season_params)
      flash[:success] = 'Your season was updated successfully!'
      redirect_to season_path(@season)
    else
      render :edit     
    end
  end
    
  def destroy
    @season.destroy
    flash[:success] = 'Your season was deleted successfully!'
    redirect_to seasons_path
  end
    
  private
    def set_season
      @season = Season.find(params[:id])            
    end
        
    def season_params
      params.require(:season).permit(:name, :slug)        
    end
end