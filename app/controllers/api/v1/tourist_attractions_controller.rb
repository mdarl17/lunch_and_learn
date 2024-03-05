class Api::V1::TouristAttractions < ApplicationController 
  def search_name 
    name = params[:name]
    require 'pry'; binding.pry

    if name.match[/\w+/] && name.length > 0
      results = TouristFacade.new.find_local_attractions(name)
      render json: TouristSerializer.new(results)
    end
  end
end