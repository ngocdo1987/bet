module WebCapture
    require 'open-uri'
    require 'json'
    
    def self.capture(capture_url)
        api_key = "b23eb6"
        api_size = "L"
        api_format = "JPG"
        api_hash = Digest::MD5.hexdigest(capture_url + api_key)
        api_cache_limit = 14
        api_timeout = 200
        
        request_url = "http://api.screenshotmachine.com/?key=#{api_key}&size=#{api_size}&format=#{api_format}&hash=#{api_hash}&cacheLimit=#{api_cache_limit}&timeout=#{api_timeout}&url=#{capture_url}"
        capture_result = open(request_url).read
        
        #File.open(Rails.root + "/public/captures/#{api_hash}.jpg", 'wb') do|f|
            #f.write(Base64.decode64(capture_result))
        #end
        
        #return "/captures/#{api_hash}.jpg"  
        return Base64.decode64(capture_result)
    end
end