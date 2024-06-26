Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'inss/calculate'
  get 'zip/search'

  resources :proponents
  devise_for :users

  root to: "proponents#index"
end
