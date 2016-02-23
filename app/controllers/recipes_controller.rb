class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: [:show, :edit, :update, :destroy] 
  before_action :set_chefs, only: [:index, :new, :create, :edit, :update]
  before_action :set_cuisines, only: [:index, :new, :create, :edit, :update]
  before_action :set_ingredient, only: [:new, :edit]
  before_action :set_nutrition, only: [:new, :edit]
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
      @ingredient = Ingredient.new(ingredient_params[:ingredients])
      @ingredient.recipe = @recipe
      @ingredient.save
      
      @nutrition = Nutrition.new(nutrition_params[:nutritions])
      @nutrition.recipe = @recipe
      @nutrition.save
      
      flash[:success] = 'Your recipe was created successfully!'
      redirect_to edit_recipe_path(@recipe)
    else
      render :new
    end
  end
    
  def edit
    @ingredients = @recipe.ingredients.order(created_at: :desc)
    @nutritions = @recipe.nutritions.order(created_at: :desc)
    @mt = "Edit #{@recipe.name}"
  end
    
  def update
    @mt = "Edit #{@recipe.name}"
    if @recipe.update(recipe_params)
      @ingredient = Ingredient.new(ingredient_params[:ingredients])
      @ingredient.recipe = @recipe
      @ingredient.save
      
      @nutrition = Nutrition.new(nutrition_params[:nutritions])
      @nutrition.recipe = @recipe
      @nutrition.save
      
      flash[:success] = 'Your recipe was updated successfully!'
      redirect_to edit_recipe_path(@recipe)
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
    
    def set_cuisines
      @cuisines = Cuisine.all    
    end
    
    def set_ingredient
      @ingredient = Ingredient.new
    end
    
    def set_nutrition
      @nutrition = Nutrition.new
    end
    
    def recipe_params
      params.require(:recipe).permit(:chef_id, :cuisine_id, :name, :summary, :description, :image, :steps, :cooking_time, :level, :featured, :hot)
    end
    
    def ingredient_params
      params.require(:recipe).permit(ingredients: [:ingredient_name])
    end
    
    def nutrition_params 
      params.require(:recipe).permit(nutritions: [:nutrition_name, :nutrition_weight])  
    end
end