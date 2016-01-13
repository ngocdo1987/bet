class VideosController < ApplicationController
    def index
        @videos = Video.search(params)
        @mt = 'List videos'
    end
    
    def show
        @video = Video.find(params[:id])        
        @mt = 'Show ' + @video.name    
    end
    
    def new
        @video = Video.new
        @mt = 'Create video'
    end
    
    def create
        @video = Video.new(video_params)
        @mt = 'Create video'
        if @video.save
            flash[:success] = "Your video was created successfully!" 
            redirect_to videos_path
        else
            render :new        
        end
    end
    
    def edit
        @video = Video.find(params[:id])
        @mt = 'Edit ' + @video.name
    end
    
    def update
        @video = Video.find(params[:id])
        @mt = 'Edit ' + @video.name
        if @video.update(video_params)
            flash[:success] = "Your video was updated successfully!"
            redirect_to video_path(@video)
        else
            render :edit        
        end
    end
    
    private
        def video_params
            params.require(:video).permit(:name, :url)    
        end
end