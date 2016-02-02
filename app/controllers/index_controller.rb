class IndexController < ApplicationController
  layout :custom_layout
  before_action :custom_header, :only => [:index, :recipes, :recipe, :chefs, :chef, :blog, :contact, :submit_recipe]
    
  def index
    @mt = 'Food & Taste - Quality recipes'
  end
    
  def recipes
    @mt = 'List recipes'
  end
    
  def recipe
    @recipe = Recipe.find(params[:id])
    @mt = @recipe.name
  end
    
  def chefs
    @chefs = Chef.all
    @mt = 'Our chefs'
  end
    
  def chef
    @chef = Chef.find(params[:id])
    @mt = @chef.chefname
  end    
    
  def blog
    @mt = 'Blog'   
  end
    
  def contact   
    @mt = 'Contact'    
  end
    
  def submit_recipe
    @mt = 'Submit recipe'     
  end
    
  def whois
    require './lib/whois'
    @mt = 'Whois Lookup'
    domain = params[:domain].blank? ? '' : params[:domain]
    domain = URI::encode(domain)
    @whois_result = domain == '' ? '' : Whois.get_domain_info(domain)
    @domain = domain
  end
    
  def domain_check
    require './lib/whois'
    @mt = 'Domain check'
    domain = params[:domain].blank? ? '' : params[:domain]
    domain = URI::encode(domain)
    @result = domain == '' ? '' : Whois.get_domain_check(domain)
    @result = @result.split("\n")
    @domain = domain
  end
    
  def web_capture
    require './lib/web_capture'
    @mt = 'Web Capture'
    url = params[:url].blank? ? '' : params[:url]
    url = URI::encode(url)
    @result = url != '' ? WebCapture.capture(url) : ''
  end
    
  def imgur_uploader
    @mt = 'Imgur Uploader'
  end
    
  def sms
    @mt = 'Send SMS'
    phone_number = params[:phone_number].blank? ? '' : params[:phone_number]
    message = params[:message].blank? ? '' : params[:message]
    
    if params[:commit]
      if phone_number != '' && message != ''
        require 'twilio-ruby'
 
        # Get your Account Sid and Auth Token from twilio.com/user/account
        account_sid = 'AC2a943f4b4618e691599fc71e2d63619d'
        auth_token = '2c8ba8818bbabcb5f27415603ab9d1b0'
        @client = Twilio::REST::Client.new account_sid, auth_token
             
        message = @client.account.messages.create(:body => message,
            :to => phone_number,     # Replace with your phone number
            :from => "+12015140454")   # Replace with your Twilio number
                
        @result = "Message sent successfully with sid #{message.sid}!"  
      else
        @result = 'Please enter phone number and message!'
      end
    end
  end
    
  def slim
    render :layout => false        
  end
    
  private
    def custom_layout
      case action_name
      when 'index', 'recipes', 'recipe', 'chefs', 'chef', 'blog', 'contact', 'submit_recipe'
          'recipe'
      when 'whois', 'domain_check', 'web_capture', 'imgur_uploader', 'sms'
          'mini_tools'
      else
          'application'
      end
    end
        
    def custom_header
      case action_name
      when 'index'
          @header = 'header'
      when 'recipes', 'recipe', 'chefs', 'chef', 'blog', 'contact', 'submit_recipe'
          @header = 'header1'
      else
          @header = ''
      end
    end
end