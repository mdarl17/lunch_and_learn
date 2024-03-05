class Api::V1::TouristSitesPath < ApplicationController 
  def search_name 
    name = params[:name]
    require 'pry'; binding.pry

    if name.match[/\w+/] && name.length > 0
      sites = TouristService.new.search_by_name(name)
      render json: TouristSiteSerializer.new(sites)
    end
  end
end