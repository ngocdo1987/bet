class IndexController < ApplicationController
    layout :custom_layout
    
    def index
        @header = "header"
        @mt = "Food & Taste - Quality recipes"
    end
    
    def recipes
        @header = "header1"
        @mt = "List recipes"
    end
    
    def recipe
        @recipe = Recipe.find(params[:id])
        @mt = @recipe.name
    end
    
    def chefs
        @header = "header1"
        @chefs = Chef.all
        @mt = "Our chefs"
    end
    
    def chef
        @chef = Chef.find(params[:id])
        @mt = @chef.chefname
    end    
    
    def blog
        @header = "header1"
        @mt = "Blog"     
    end
    
    def contact
        @mt = "Contact"     
    end
    
    def submit_recipe
        @mt = "Submit recipe"     
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
    
    def imgur_uploader
        @mt = 'Imgur Uploader'
    end
    
    def slim
        render :layout => false        
    end
    
    private
        def custom_layout
            case action_name
            when 'index', 'recipes', 'recipe', 'chefs', 'chef', 'blog', 'contact', 'submit_recipe'
                'recipe'
            else
                'application'
            end
        end    
end