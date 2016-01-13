class IndexController < ApplicationController
    layout 'site'
    
    def index
    
    end
    
    def slim
        render :layout => false        
    end
end