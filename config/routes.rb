Rails.application.routes.draw do
  # Home page
  root 'places#index'

  # User routes
  resources :users, only: [:new, :create]

  # Session routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Additional routes
  resources :places
  resources :entries
end
