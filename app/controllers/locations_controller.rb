class LocationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  require './lib/ar'
    
  def index
    @locations = Ar.search(Location, params)
    @mt = 'List locations'
  end
    
  def show
    @mt = "Show #{@location.name}"
  end
    
  def new
    @location = Location.new
    @mt = 'Create location'
  end

  def create
    @location = Location.new(location_params)
    @mt = 'Create location'
    if @location.save
      flash[:success] = 'Your location was created successfully!'
      redirect_to locations_path
    else
      render :new        
    end
  end
    
  def edit
    @mt = "Edit #{@location.name}"
  end
    
  def update
    @mt = "Edit #{@location.name}"
    if @location.update(location_params)
      flash[:success] = 'Your location was updated successfully!'
      redirect_to location_path(@location)
    else
      render :edit     
    end
  end
    
  def destroy
    @location.destroy
    flash[:success] = 'Your location was deleted successfully!'
    redirect_to locations_path
  end
  
  private
    def set_location
      @location = Location.find(params[:id])            
    end
        
    def location_params
      params.require(:location).permit(:name, :address, :phone, :fax, :email)        
    end
    
end