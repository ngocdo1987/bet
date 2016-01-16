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
    
    def web_capture
        require 'screenshot_machine'
        
        url = params[:url].blank? ? '' : params[:url]
        
        if url != ''
            ScreenshotMachine.configure do |config|
                config.key        = 'b23eb6'
                config.size       = 'X'
                config.format     = 'JPG'
                config.cacheLimit = 14
                config.timeout    = 200
            end
            
            sm = ScreenshotMachine::Generator.new(url)
            # Returns a binary stream of the file
            file_name = Digest::MD5.hexdigest("#{url}b23eb6")
            file_path ||= "#{Rails.root}/public/captures/#{file_name}.jpg"
            f = File.new(file_path,  "wb")
            f.write(sm.screenshot)
            f.close
            
            @result = file_name
        else
            @result = ''        
        end    

        @mt = 'Web Capture'
        
        @url = url
    end
    
    def slim
        render :layout => false        
    end
end