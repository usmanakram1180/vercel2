Rails.application.routes.draw do
  get 'likes/create'
  mount Motor::Admin => '/motor_admin'
  devise_for :users
  get '/home', to: "homes#index"
  get '/logout', to: "logouts#index"
  resources :homes do
    resources :comments, only: [:create]
  end
  resources :logouts
  resources :timelines
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root "timelines#index"
end
