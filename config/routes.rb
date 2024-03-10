Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get "/api/v1/countries/", to: "api/v1/selected_country#search_name", as: "selected_country"
  get "/api/v1/geo_coordinates/", to: "api/v1/country_capital_coordinates#search_name", as: "capital_coordinates"

  get "/api/v1/tourist_sites", to: "api/v1/tourist_attractions#search_name", as: "search_tourist_sites"
end

