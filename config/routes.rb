Rails.application.routes.draw do
  get '/', to: 'pages#home'
  get '/home', to: 'pages#home'
end
