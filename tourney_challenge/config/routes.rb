Rails.application.routes.draw do
  resources :brackets
  resources :tournaments
  resources :teams
  resources :atheletes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
