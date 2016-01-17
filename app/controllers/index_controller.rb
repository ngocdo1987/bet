class IndexController < ApplicationController
    
    def index
    
    end
    
    def whois
        require './lib/whois'
        @mt = 'Whois Lookup'
        domain = params[:domain].blank? ? '' : params[:domain]
        @whois_result = domain == '' ? '' : Whois.get_domain_info(domain)
        @domain = domain
    end
    
    def domain_check
        require './lib/whois'
        @mt = 'Domain check'
        domain = params[:domain].blank? ? '' : params[:domain]
        @result = domain == '' ? '' : Whois.get_domain_check(domain)
        @result = @result.split("\n")
    end
    
    def web_capture
        require './lib/web_capture'
        @mt = 'Web Capture'
        url = params[:url].blank? ? '' : params[:url]
        @result = url != '' ? WebCapture.capture(url) : ''
    end
    
    def slim
        render :layout => false        
    end
end