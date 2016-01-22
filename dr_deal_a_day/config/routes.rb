Rails.application.routes.draw do
  root 'data_files#index'

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :data_files, only: [ :index, :new, :create ]
  resources :sessions, only: [ :new, :create, :destroy ]
end
