Rails.application.routes.draw do
  
  resources :articles
  resources :categories, only: [:index, :new, :create]
  resources :sessions
  resources :users, only: [:new, :create] 

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'home#index' 
end
