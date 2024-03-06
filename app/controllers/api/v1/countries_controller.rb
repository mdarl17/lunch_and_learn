class Api::V1::CountriesController < ApplicationController
  def search_name
    if params[:name]
      country = CountryFacade.new.country_by_name(params[:name])
      render json: CountrySerializer.new(country)
    end
  end
end