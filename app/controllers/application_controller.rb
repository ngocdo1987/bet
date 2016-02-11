class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate
  
  private
    def authenticate
      if ['categories', 'chefs', 'leagues', 'matches', 'recipes', 'tags', 'teams', 'users', 'videos'].include? params[:controller]
        authenticate_user!      
      end
    end
end
