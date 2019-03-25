Rails.application.routes.draw do
  resources :athletes
  resources :users
  resources :brackets
  resources :tournaments
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
