class CategoriesController < ApplicationController
    require './lib/ar'
    
    def index
        @categories = Ar.ancestry_ar(Category, params)
        @mt = 'List categories'
    end
    
    def show
        @category = Category.find(params[:id])
        @mt = "Show #{@category.name}"          
    end
    
    def new
        @category = Category.new
        @ancestry_categories = Ar.ancestry(Category)
        @mt = 'Create category'
    end
    
    def create
        @category = Category.new(category_params)
        @ancestry_categories = Ar.ancestry(Category)
        @mt = 'Create category'
        
        if @category.save
            flash[:success] = 'Your category was created successfully!'
            redirect_to categories_path
        else
            render :new    
        end
    end
    
    def edit
        @category = Category.find(params[:id])
        @ancestry_categories = Ar.ancestry(Category)
        @mt = "Edit #{@category.name}"
    end
    
    def update
        @category = Category.find(params[:id])
        @ancestry_categories = Ar.ancestry(Category)
        @mt = "Edit #{@category.name}"
        
        if @category.update(category_params)
            flash[:success] = 'Your category was updated successfully!'
            redirect_to category_path(@category)
        else
            render :edit     
        end
    end
    
    private
        def category_params
            params.require(:category).permit(:name, :slug, :parent_id)    
        end
end