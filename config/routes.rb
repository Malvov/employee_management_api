Rails.application.routes.draw do

  # Home controller routes.
  root   'home#index'
  get    'auth', to: 'home#auth'

  concern :api_base do
    concerns :employee_actions, :user_actions
  end

  concern :employee_actions do
    resources :employees, only: [:index, :show]
  end

  concern :user_actions do
      # Get login token from Knock
      post   'user_token', to: 'user_token#create'
  
      # User actions
      get    '/users', to: 'users#index'
      get    '/users/current', to: 'users#current'
      post   '/users/create', to: 'users#create'
      patch  '/user/:id', to: 'users#update'
      delete '/user/:id', to: 'users#destroy'
  end
  
  namespace :api do
    namespace :v1 do
      concerns :api_base
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
