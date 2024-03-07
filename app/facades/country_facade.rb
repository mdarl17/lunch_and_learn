class CountryFacade 
  def country_by_name(name)
    # replace whitespace w/ %20 (may be a function 'transcode??'for this??)
    # this operation will be performed on all names, has no effect on one-word countries
    if name && name.length > 0
      search_res = CountryService.new.search_name(name.gsub(/\s/, "%20"))
      common_name = search_res[0][:name][:common]
      lat_long = search_res[0][:capitalInfo][:latlng]
    else
      return nil
    end
    CountryPoro.new(name: common_name, latitude: lat_long[0], longitude: lat_long[1])
  end
end