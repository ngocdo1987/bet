Rails.application.routes.draw do
  
  devise_for :users
  root 'index#index'
  
  get '/angular', to: 'index#angular'
  get '/list-recipes', to: 'index#recipes'
  get '/our-chefs', to: 'index#chefs'
  get '/blog', to: 'index#blog'
  get '/contact', to: 'index#contact'
  get '/submit-recipe', to: 'index#submit_recipe'
  
  get '/whois', to: 'index#whois'
  post '/whois', to: 'index#whois'
  
  get '/domain_check', to: 'index#domain_check'
  post '/domain_check', to: 'index#domain_check'
  
  get '/web_capture', to: 'index#web_capture'
  post '/web_capture', to: 'index#web_capture'
  
  get '/imgur_uploader', to: 'index#imgur_uploader'
  post '/imgur_uploader', to: 'index#imgur_uploader'
  
  get '/sms', to: 'index#sms'
  post '/sms', to: 'index#sms'
  
  get '/rake', to: 'rake#index'
  post '/rake', to: 'rake#index'
  
  get '/slim', to: 'index#slim'
  get '/admin', to: 'pages#home'
  
  get '/football', to: 'football#index'
  get '/football/fixtures-and-results', to: 'football#fixtures_and_results'
  get '/football/standings', to: 'football#standings'
  get '/football/players-and-staff', to: 'football#players_and_staff'
  get '/football/blog', to: 'football#blog'
  
  resources :recipes
  resources :chefs
  
  resources :leagues do
    member do
      get 'new_teams'
      post 'create_teams'
    end
  end
  
  resources :matches
  resources :teams
  resources :odd_spreads
  resources :odd_money_lines
  resources :odd_total_points
  resources :seasons
  resources :videos
  
  resources :categories
  resources :tags
  scope "/admin" do
    resources :users
  end
  #resources :users
end
