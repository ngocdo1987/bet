class SettingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_setting, only: [:show, :edit, :update, :destroy]    
  require './lib/ar'
    
  def index
    @settings = Ar.search(Setting, params)
    @mt = 'List settings'
  end
    
  def show
    @mt = "Show #{@setting.name}"          
  end
    
  def new
    @setting = Setting.new
    @mt = 'Create setting'
  end
    
  def create
    @setting = Setting.new(setting_params)
    @mt = 'Create setting'
        
    if @setting.save
      flash[:success] = 'Your setting was created successfully!'
      redirect_to settings_path
    else
      render :new    
    end
  end
    
  def edit
    @mt = "Edit #{@setting.name}"
  end
    
  def update
    @mt = "Edit #{@setting.name}"
        
    if @setting.update(setting_params)
      flash[:success] = 'Your setting was updated successfully!'
      redirect_to setting_path(@setting)
    else
      render :edit     
    end
  end
    
  def destroy
    @setting.destroy
    flash[:success] = 'Your setting was deleted successfully!'
    redirect_to settings_path      
  end
    
  private
    def set_setting
      @setting = Setting.find(params[:id])    
    end
        
    def setting_params
      params.require(:setting).permit(:name, :value)    
    end
end