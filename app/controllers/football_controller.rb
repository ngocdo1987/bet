class FootballController < ApplicationController
    layout 'football'
    
    def index
        @body_class = "home page page-template page-template-template-homepage page-template-template-homepage-php"    
        @mt = "Football"    
    end
    
    def fixtures_and_results
        @body_class = "page page-parent page-template-default"
        @mt = "Fixtures and results"    
    end
    
    def standings
        @body_class = "page page-parent page-template-default"
        @mt = "Standings"    
    end
    
    def players_and_staff
        @body_class = "page page-parent page-template-default"
        @mt = "Players and staff"      
    end
    
    def blog
        @body_class = "page page-parent page-template-default"
        @mt = "Blog"    
    end
end