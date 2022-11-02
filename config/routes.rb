Rails.application.routes.draw do
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
	get '/team', to: 'static_pages#team'
  get '/welcome/:anything', to: 'static_pages#welcome'
  #get '/user/:id', to: 'static_pages#user'

  resources :gossips
  resources :users
end