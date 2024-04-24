Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "reservations#new"

  get "/reservations", to: "reservations#index"
  get "/reservations/new", to: "reservations#new", as: "new_reservation"
  post "/reservations", to: "reservations#create"
  get "/search/new", to: "reservations#new_search", as: "new_search"
  get "/search", to: "reservations#search"
  get "/custom", to: "reservations#custom"
end
