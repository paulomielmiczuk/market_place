Rails.application.routes.draw do
  devise_for :users
  root to: "places#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :places do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[update request]
  get "/requests", to: "bookings#requests", as: "requests"
  get "/my_places", to: "places#my_places", as: "my_places"
end
