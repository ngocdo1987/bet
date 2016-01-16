Rails.application.routes.draw do
  root 'index#index'
  
  get '/whois', to: 'index#whois'
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
end
