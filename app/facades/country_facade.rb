class CountryFacade 
  def country_by_name(name)
    service = CountryService.new
    search_res = service.search_name(name)
    if search_res.present?
      name = search_res[0][:name][:common]
      lat_long = search_res[0][:capitalInfo][:latlng]
    else
      nil
    end
    CountryPoro.new(name: name, latitude: lat_long[0], longitude: lat_long[1])
  end
end