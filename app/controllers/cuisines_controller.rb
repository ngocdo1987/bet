class CuisinesController < ApplicationController
  load_and_authorize_resource
  before_action :set_cuisine, only: [:show, :edit, :update, :destroy]    
  require './lib/ar'
    
  def index
    @cuisines = Ar.search(Cuisine, params)
    @mt = 'List cuisines'
  end
    
  def show
    @mt = "Show #{@cuisine.name}"          
  end
    
  def new
    @cuisine = Cuisine.new
    @mt = 'Create cuisine'
  end
    
  def create
    @cuisine = Cuisine.new(cuisine_params)
    @mt = 'Create cuisine'
        
    if @cuisine.save
      flash[:success] = 'Your cuisine was created successfully!'
      redirect_to cuisines_path
    else
      render :new    
    end
  end
    
  def edit
    @mt = "Edit #{@cuisine.name}"
  end
    
  def update
    @mt = "Edit #{@cuisine.name}"
        
    if @cuisine.update(cuisine_params)
      flash[:success] = 'Your cuisine was updated successfully!'
      redirect_to cuisine_path(@cuisine)
    else
      render :edit     
    end
  end
    
  def destroy
    @cuisine.destroy
    flash[:success] = 'Your cuisine was deleted successfully!'
    redirect_to cuisines_path      
  end
    
  private
    def set_cuisine
      @cuisine = Cuisine.find(params[:id])    
    end
        
    def cuisine_params
      params.require(:cuisine).permit(:name, :slug, :description)    
    end
end