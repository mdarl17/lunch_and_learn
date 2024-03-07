Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get "/api/v1/countries/", to: "api/v1/countries#search_name", as: "search_country_name"

  get "/api/v1/tourist_sites", to: "api/v1/tourist_attractions#search_name", as: "search_tourist_sites"
end
