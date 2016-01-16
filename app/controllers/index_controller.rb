class IndexController < ApplicationController
    
    def index
    
    end
    
    def whois
        require './lib/ar'
        require './lib/whois'
        @mt = 'Whois Lookup'
        domain = params[:domain].blank? ? '' : params[:domain]
        @whois_result = domain == '' ? '' : Whois.get_domain_info(domain)
        @domain = domain
    end
    
    def slim
        render :layout => false        
    end
end