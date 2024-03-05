class Api::V1::CountriesController < ApplicationController
  def search_name
    name = params[:name]
    if name
      lat_long = CountryService.new
      country = CountryFacade.new.country_by_name(params[:name])
      res = render json: CountrySerializer.new(country)
    end
  end

  private 
end