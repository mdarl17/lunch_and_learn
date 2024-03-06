class Api::V1::TouristAttractions < ApplicationController 
  def search_name 
    name = params[:name]

    if name.match[/\w+/] && name.length > 0
      results = TouristFacade.new.find_local_attractions(name)
      render json: AttractionSerializer.new(results)
    end
  end
end