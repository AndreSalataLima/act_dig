Rails.application.routes.draw do
  root 'pages#landing_page'

  # Non-nested routes
  # get 'pages/home'
  # get 'pages/dashboard'
  # get 'pages/home2'
  get 'pages/landing_page'
  # get 'session_histories/index'
  # get 'session_histories/show'
  # get 'sensors/show'
  # get 'sensors/edit'
  # get 'pages/index'

  # Nested routes for users, sessions, exercises
  # resources :users do
    # resources :sessions do
      # resources :exercises do
        # resources :sensors, only: [:show, :edit]
      # end
      # resources :session_histories, only: [:index, :show]
    # end
  # end

  # Rota de verificação de saúde
  # get "up" => "rails/health#show", as: :rails_health_check
end
