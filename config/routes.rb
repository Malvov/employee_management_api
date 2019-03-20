Rails.application.routes.draw do

  # Home controller routes.
  root   'home#index'
  get    'auth', to: 'home#auth'

  concern :api_base do
    concerns :employee_actions, :user_actions, :shift_actions
  end

  concern :employee_actions do
    # Employee actions, create and update from User
    resources :employees, only: [:index, :show]
  end

  concern :shift_actions do
    # Shifts actions
    resources :shifts, except: [:new, :edit]
  end

  concern :user_actions do
      # Get login token from Knock
      post   'user_token', to: 'user_token#create'
  
      # User actions
      resources :users
  end
  
  namespace :api do
    namespace :v1 do
      concerns :api_base
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
