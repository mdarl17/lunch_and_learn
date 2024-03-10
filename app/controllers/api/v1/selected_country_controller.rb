class Api::V1::SelectedCountryController < ApplicationController
  def search_name
    facade = SelectedCountryFacade.new
    selected_country = facade.select_random_country
    return [] if selected_country.empty?
    render json: SelectedCountrySerializer.new(selected_country)
  end
end