Rails.application.routes.draw do
  
  resources :articles do 
    resource :vote, only: [:create, :destroy], module: :articles 
  end
  resources :categories, only: [:index, :show, :new, :create, :destroy]
  resources :sessions
  resources :users, only: [:new, :create] 

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'home#index' 
end
