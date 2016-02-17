class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]    
  require './lib/ar'
    
  def index
    @posts = Ar.search(Post, params)
    @mt = 'List posts'
  end
    
  def show
    @mt = "Show #{@post.name}"          
  end
    
  def new
    @post = Post.new
    @mt = 'Create post'
  end
    
  def create
    @post = Post.new(post_params)
    @mt = 'Create post'
        
    if @post.save
      flash[:success] = 'Your post was created successfully!'
      redirect_to posts_path
    else
      render :new    
    end
  end
    
  def edit
    @mt = "Edit #{@post.name}"
  end
    
  def update
    @mt = "Edit #{@post.name}"
        
    if @post.update(post_params)
      flash[:success] = 'Your category was updated successfully!'
      redirect_to post_path(@post)
    else
      render :edit     
    end
  end
    
  def destroy
        
  end
    
  private
    def set_post
      @post = Post.find(params[:id])    
    end
        
    def post_params
      params.require(:post).permit(:name, :slug, :image, :description, :content)    
    end
end