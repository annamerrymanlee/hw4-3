Rails.application.routes.draw do
  # Home page
  root 'places#index'

  # User routes (limited to only what's necessary)
  resources :users, only: [:new, :create]

  # Session routes (for login and logout)
  resource :session, only: [:new, :create, :destroy], path_names: { new: 'login' }

  # Nested resources for places and entries
  resources :places do
    resources :entries, only: [:new, :create, :show]
  end

  # Add additional routes for actions that need to be handled explicitly
  # For example, the logout route explicitly needed for session destruction
  delete 'logout', to: 'sessions#destroy', as: :logout
end
