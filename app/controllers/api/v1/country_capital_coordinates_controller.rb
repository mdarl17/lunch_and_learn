class Api::V1::CountryCapitalCoordinatesController < ApplicationController 
  def search_name 
    name = params[:name]
    if name.match(/\w+/) && name.length > 0
      facade = CountryCapitalCoordinatesFacade.new
      capital_data_poro = facade.find_country(name)
      render json: CapitalCoordinatesSerializer.new(capital_data_poro)
    end
  end
end