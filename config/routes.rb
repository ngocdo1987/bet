Rails.application.routes.draw do
  resources :tags
  root 'index#index'
  
  get '/whois', to: 'index#whois'
  post '/whois', to: 'index#whois'
  
  get '/domain_check', to: 'index#domain_check'
  post '/domain_check', to: 'index#domain_check'
  
  get '/web_capture', to: 'index#web_capture'
  post '/web_capture', to: 'index#web_capture'
  
  get '/imgur_uploader', to: 'index#imgur_uploader'
  post '/imgur_uploader', to: 'index#imgur_uploader'
  
  get '/rake', to: 'rake#index'
  post '/rake', to: 'rake#index'
  
  get '/slim', to: 'index#slim'
  get '/admin', to: 'pages#home'
  
  resources :recipes
  resources :chefs
  
  resources :leagues
  resources :matches
  resources :teams
  resources :odd_spreads
  resources :odd_money_lines
  resources :odd_total_points
  resources :videos
  
  resources :categories
end
