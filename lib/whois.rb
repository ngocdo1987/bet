module Whois
    require 'open-uri'
    require 'json'
    
    # whoisxmlapi.com API
    def self.get_domain_info(domain)
        username = "ngocdo"
        password = "28021987"
        
        #######################
        # Use a JSON resource #
        #######################
        format = "JSON"
        url = 'http://www.whoisxmlapi.com/whoisserver/WhoisService?domainName=' + domain + '&username=' + username + '&password=' + password + '&outputFormat=' + format

        # Open the resource
        buffer = open(url).read

        # Parse the JSON result
        result = JSON.parse(buffer)
        
        return result
    end
    
    # instantdomainsearch.com API
    def self.get_domain_check(domain)
        request_url = "https://instantdomainsearch.com/all/#{domain}?tldTags=popular&partTld=&country=&limit=20&hilite=strong"
        result = open(request_url).read
        result = JSON.parse(result)
        return result
    end
end