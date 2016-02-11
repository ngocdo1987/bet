class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :edit, :update, :destroy] 
  before_action :set_chefs, only: [:index, :new, :create, :edit, :update]
  require './lib/ar'
    
  def index
    @recipes = Ar.search(Recipe, params)
    @mt = 'List recipes'
  end
    
  def show
    @mt = "Show #{@recipe.name}"
  end
    
  def new
    @recipe = Recipe.new
    @mt = 'Create recipe'
  end
    
  def create
    @recipe = Recipe.new(recipe_params)
    @mt = 'Create recipe'
        
    if @recipe.save
      flash[:success] = 'Your recipe was created successfully!'
      redirect_to recipes_path
    else
      render :new
    end
  end
    
  def edit
    @mt = "Edit #{@recipe.name}"
  end
    
  def update
    @mt = "Edit #{@recipe.name}"
    if @recipe.update(recipe_params)
      flash[:success] = 'Your recipe was updated successfully!'
      redirect_to recipe_path(@recipe)
    else
      render :edit        
    end
  end
    
  def destroy
    @recipe.destroy
    flash[:success] = 'Your recipe was deleted successfully!'
    redirect_to recipes_path
  end
    
  private
    def set_recipe
      @recipe = Recipe.find(params[:id])            
    end
    
    def set_chefs
      @chefs = Chef.all        
    end
    
    def recipe_params
      params.require(:recipe).permit(:chef_id, :name, :summary, :description, :image, :ingredients, :steps, :cooking_time, :level)
    end
end