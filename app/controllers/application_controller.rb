class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate
  layout :angular_layout
  
  # FIX CANCAN ERROR -> http://stackoverflow.com/questions/17335329/activemodelforbiddenattributeserror-when-creating-new-user
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end
  
  private
    def authenticate
      if ['categories', 'chefs', 'leagues', 'matches', 'recipes', 'tags', 'teams', 'users', 'videos'].include? params[:controller]
        authenticate_user!      
      end
    end
    
    def angular_layout
      if ['categories', 'chefs', 'leagues', 'matches', 'recipes', 'tags', 'teams', 'users', 'videos'].include? params[:controller]
        if session[:angular].blank?
          'application'
        else
          'application_angular'
        end
      end
    end
end
