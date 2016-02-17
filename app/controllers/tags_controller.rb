class TagsController < ApplicationController
  load_and_authorize_resource
  before_action :set_tag, only: [:show, :edit, :update, :destroy]    
  require './lib/ar'
    
  def index
    @tags = Ar.search(Tag, params)
    @mt = 'List tags'
  end
    
  def show
    @mt = "Show #{@tag.name}"          
  end
    
  def new
    @tag = Tag.new
    @mt = 'Create tag'
  end
    
  def create
    @tag = Tag.new(tag_params)
    @mt = 'Create tag'
        
    if @tag.save
      flash[:success] = 'Your tag was created successfully!'
      redirect_to tags_path
    else
      render :new    
    end
  end
    
  def edit
    @mt = "Edit #{@tag.name}"
  end
    
  def update
    @mt = "Edit #{@tag.name}"
        
    if @tag.update(tag_params)
      flash[:success] = 'Your tag was updated successfully!'
      redirect_to tag_path(@tag)
    else
      render :edit     
    end
  end
    
  def destroy
    @tag.destroy
    flash[:success] = 'Your tag was deleted successfully!'
    redirect_to tags_path      
  end
    
  private
    def set_tag
      @tag = Tag.find(params[:id])    
    end
        
    def tag_params
      params.require(:tag).permit(:name, :slug)    
    end
end