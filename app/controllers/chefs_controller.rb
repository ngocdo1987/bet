class ChefsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  require './lib/ar'
    
  def index
    @chefs = Ar.search(Chef, params)
    @mt = 'List chefs'
  end
    
  def show
    @mt = "Show #{@chef.chefname}"
  end
    
  def new
    @chef = Chef.new
    @mt = 'Create chef'
  end
    
  def create
    @chef = Chef.new(chef_params)
    @mt = 'Create chef'
    if @chef.save
      flash[:success] = 'Your chef was created successfully!'
      redirect_to chefs_path
    else
      render :new 
    end
  end
    
  def edit
    @mt = "Edit #{@chef.chefname}"
  end

  def update
    @mt = "Edit #{@chef.chefname}"
    if @chef.update(chef_params)
      flash[:success] = 'Your chef was updated successfully!'
      redirect_to chef_path(@chef)
    else
      render :edit        
    end
  end
    
  def destroy
    @chef.destroy
    flash[:success] = 'Your chef was deleted successfully!'
    redirect_to chefs_path
  end
    
  private
    def set_chef
      @chef = Chef.find(params[:id])   
    end
        
    def chef_params
      params.require(:chef).permit(:chefname, :email, :image, :position, :description, :facebook, :twitter, :linkedin, :gplus) 
    end
end