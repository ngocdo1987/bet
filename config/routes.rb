Rails.application.routes.draw do
  resources :leagues
  resources :leagues
  get '/', to: 'pages#home'
  get '/home', to: 'pages#home'
end
