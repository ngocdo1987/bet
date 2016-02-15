class VideosController < ApplicationController
  load_and_authorize_resource
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  require './lib/ar'
    
  def index
    @videos = Ar.search(Video, params)
    @mt = 'List videos'
  end
    
  def show     
    @mt = "Show #{@video.name}"    
  end
    
  def new
    @video = Video.new
    @mt = 'Create video'
    
    # For test
    @names = [{ id: 1, name: 'John' }, { id: 2, name: 'Mike' }]
    @options = { theme: 'facebook' }
  end
    
  def create
    @video = Video.new(video_params)
    @mt = 'Create video'
    
    # For test
    @names = [{ id: 1, name: 'John' }, { id: 2, name: 'Mike' }]
    
    if @video.save
      flash[:success] = 'Your video was created successfully!'
      redirect_to videos_path
    else
      render :new        
    end
  end
    
  def edit
    @mt = "Edit #{@video.name}"
    
    # For test
    @names = [{ id: 1, name: 'John' }, { id: 2, name: 'Mike' }]
  end
    
  def update
    @mt = "Edit #{@video.name}"
    
    # For test
    @names = [{ id: 1, name: 'John' }, { id: 2, name: 'Mike' }]
    
    if @video.update(video_params)
      flash[:success] = 'Your video was updated successfully!'
      redirect_to video_path(@video)
    else
      render :edit        
    end
  end
    
  def destroy
    @video.destroy
    flash[:success] = 'Your video was deleted successfully!'
    redirect_to videos_path
  end
  
  private
    def set_video
      @video = Video.find(params[:id])        
    end
    
    def video_params
      params.require(:video).permit(:name, :url)    
    end
end