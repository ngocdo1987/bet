class RecipesController < ApplicationController
    def index
        @recipes = Recipe.paginate(page: params[:page], per_page: 5)
        @mt = 'List recipes'
    end
    
    def show
        @recipe = Recipe.find(params[:id])
        @mt = 'Show ' + @recipe.name
    end
    
    def new
        @recipe = Recipe.new
        @mt = 'Create recipe'
    end
    
    def create
        @recipe = Recipe.new(recipe_params)     
        @recipe.chef = Chef.find(2)
        @mt = 'Create recipe'
        
        if @recipe.save
            flash[:success] = "Your recipe was created successfully!"
            redirect_to recipes_path
        else
            render :new
        end
    end
    
    def edit
        @recipe = Recipe.find(params[:id])    
        @mt = 'Edit ' + @recipe.name
    end
    
    def update
        @recipe = Recipe.find(params[:id])
        @mt = 'Edit ' + @recipe.name
        if @recipe.update(recipe_params)
            flash[:success] = "Your recipe was updated successfully!"
            redirect_to recipe_path(@recipe)
        else
            render :edit        
        end
    end
    
    private
        def recipe_params
            params.require(:recipe).permit(:name, :summary, :description)
        end
end