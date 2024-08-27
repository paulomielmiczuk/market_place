Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/places", to: "places#index", as: "all_places"
  post "/places", to: "places#create", as: "places"
  get "/places/new", to: "places#new", as: "new_place"
  get "/places/:id", to: "places#show", as: "place"

  get "/bookings", to: "bookings#index", as: "bookings"

  # Defines the root path route ("/")
  # root "posts#index"
  resources :places do
    resources :bookings, only: %i[new create]
  end

  get "/requests", to: "bookings#requests", as: "requests"

end
