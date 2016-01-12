Rails.application.routes.draw do
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  
  resources :recipes
  resources :chefs
  
  resources :leagues
  resources :matches
  resources :odd_spreads
  resources :odd_money_lines
  resources :odd_total_points
  resources :videos
end
