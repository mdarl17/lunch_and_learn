class Api::V1::RandomCountryController < ApplicationController
  def search_name
    if params[:name]
      country = RandomCountryService.new.tourist_sights_with_country_name(params[:name])
      render json: RandomCountrySerializer.new(country)
    end
  end
end