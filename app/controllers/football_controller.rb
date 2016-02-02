class FootballController < ApplicationController
  layout 'football'
  before_action :custom_body_class
    
  def index
    @mt = 'Football'
  end
    
  def fixtures_and_results
    @mt = 'Fixtures and results'    
  end
    
  def standings
    @mt = 'Standings'    
  end
    
  def players_and_staff
    @mt = 'Players and staff'
  end
    
  def blog
    @mt = 'Blog'   
  end
    
  private
    def custom_body_class
      case action_name
      when 'index'
        @body_class = 'home page page-template page-template-template-homepage page-template-template-homepage-php'
      else
        @body_class = 'page page-parent page-template-default'    
      end    
    end
end