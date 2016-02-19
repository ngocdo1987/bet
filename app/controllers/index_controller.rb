class IndexController < ApplicationController
  layout :custom_layout
  before_action :custom_header, :only => [:index, :recipes, :recipe, :chefs, :chef, :blog, :contact, :send_email, :submit_recipe]
    
  def index
    @mt = 'Food & Taste - Quality recipes'
    @featured_recipes = Recipe.where(featured: true)
    @hot_recipes = Recipe.where(hot: true).limit(6).as_json
    @home_chefs = Chef.where(home: true).limit(4)
    @home_posts = Post.where(home: true).limit(4)
  end
    
  def recipes
    @mt = 'List recipes'
  end
    
  def recipe
    @recipe = Recipe.find(params[:id])
    @mt = @recipe.name
  end
    
  def chefs
    @head_chef = Chef.where("position = 'Head Chef'").first
    @chefs = Chef.all
    @mt = 'Our chefs'
  end
    
  def chef
    @chef = Chef.find(params[:id])
    @mt = @chef.chefname
  end    
    
  def blog
    @mt = 'Blog'  
    @posts = Post.all
    @categories = Category.all
    @tags = Tag.all
  end
    
  def contact   
    @mt = 'Contact'    
    @locations = Location.limit(3)
    @contact_form = ContactForm.new
  end
    
  def send_email
    @mt = 'Contact'  
    @locations = Location.limit(3)
    @contact_form = ContactForm.new(contact_form_params)
    if @contact_form.validate
      ContactMailer.send_contact_email(contact_form_params).deliver
      flash[:success] = 'Send email successfully!'
      
      redirect_to '/contact#quick_contact'
    else
      render :contact
    end
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
    
  def angular
    if session[:angular].blank?
      session[:angular] = 1
    else  
      session.delete :angular  
    end
    
    redirect_to :back
  end  
    
  private
    def custom_layout
      case action_name
      when 'index', 'recipes', 'recipe', 'chefs', 'chef', 'blog', 'contact', 'send_email', 'submit_recipe'
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
      when 'recipes', 'recipe', 'chefs', 'chef', 'blog', 'contact', 'send_email', 'submit_recipe'
        @header = 'header1'
      else
        @header = ''
      end
    end
    
    def contact_form_params
      params.require(:contact_form).permit(:name, :email, :phone, :message)  
    end
end