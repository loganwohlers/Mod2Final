Rails.application.routes.draw do
  resources :athletes
  resources :users
  resources :brackets
  resources :teams

  root 'teams#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
