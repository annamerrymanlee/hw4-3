Rails.application.routes.draw do
  # Home page
  root 'places#index'

  # User routes (signup)
  resources :users, only: [:new, :create]

  # Session routes (login/logout)
  resource :session, only: [:new, :create, :destroy], path_names: { new: 'login', destroy: 'logout' }

  # Nested resources for places and entries
  resources :places do
    resources :entries, only: [:new, :create, :show, :index]
  end
end
