Rails.application.routes.draw do
  get 'pages/home'
  get 'session_histories/index'
  get 'session_histories/show'
  get 'sensors/show'
  get 'sensors/edit'
  get 'exercises/index'
  get 'exercises/show'
  get 'exercises/new'
  get 'exercises/edit'
  get 'sessions/index'
  get 'sessions/show'
  get 'sessions/new'
  get 'sessions/edit'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#home'

  Rails.application.routes.draw do
  get 'pages/home'
  get 'session_histories/index'
  get 'session_histories/show'
  get 'sensors/show'
  get 'sensors/edit'
  get 'exercises/index'
  get 'exercises/show'
  get 'exercises/new'
  get 'exercises/edit'
  get 'sessions/index'
  get 'sessions/show'
  get 'sessions/new'
  get 'sessions/edit'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
    resources :users do
      resources :sessions do
        resources :exercises do
          resources :sensors, only: [:show, :update]
        end
        resources :session_histories, only: [:index, :show]
      end
    end
  end

end
