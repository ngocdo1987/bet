class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]    
  require './lib/ar'
    
  def index
    @categories = Ar.ancestry_ar(Category, params)
    @mt = 'List categories'
  end
    
  def show
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
    @ancestry_categories = Ar.ancestry(Category)
    @mt = "Edit #{@category.name}"
  end
    
  def update
    @ancestry_categories = Ar.ancestry(Category)
    @mt = "Edit #{@category.name}"
        
    if @category.update(category_params)
      flash[:success] = 'Your category was updated successfully!'
      redirect_to category_path(@category)
    else
      render :edit     
    end
  end
    
  def destroy
        
  end
    
  private
    def set_category
      @category = Category.find(params[:id])    
    end
        
    def category_params
      params.require(:category).permit(:name, :slug, :parent_id)    
    end
end