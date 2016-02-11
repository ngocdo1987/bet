class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  require './lib/ar'
  
  def index
    @users = Ar.search(User, params)
    @mt = 'List users'
  end
  
  def show
    @mt = "Show #{@user.username}"
  end
  
  def new
    @user = User.new
    @mt = 'Create user'
  end
  
  def create
    @user = User.new(user_params)
    @mt = 'Create user'
    if @user.save
      flash[:success] = 'Your user was created successfully!'
      redirect_to users_path
    else
      render :new
    end
  end
  
  def edit
    @mt = "Edit #{@user.username}"
  end
  
  def update
    @mt = "Edit #{@user.username}"
    if @user.update(user_params)
      flash[:success] = 'Your user was updated successfully!'
      redirect_to user_path(@user)
    else
      render :edit        
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = 'Your user was deleted successfully!'
    redirect_to users_path
  end
  
  private
    def set_user
      @user = User.find(params[:id])  
    end
    
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end