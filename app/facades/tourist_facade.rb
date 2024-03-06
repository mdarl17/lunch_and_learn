class TouristFacade
  def find_local_attractions(name)
    lat = convert_name_to_lat_lon(name)[:lat]
    lon = convert_name_to_lat_lon(name)[:lon]

    # if right_type?(lat) && right_type?(lon)
      res = TouristService.new.find_attractions_with_lat_and_lon(lat, lon)

    # else
      # return "Wrong type error"
    # end
    make_attraction_poros(res[:features])
  end

  def convert_name_to_lat_lon(name)
    country = CountryFacade.new.country_by_name(name)
    { lat: country.latitude, lon: country.longitude }
  end
  
  def right_type?(val)
    return false if val.class != Float
  end

  def make_attraction_poros(country_data)
    attraction_objs = country_data.map do |attraction|
      {
        id: "null",
        type: "tourist_site",
        name: attraction[:properties][:name],
        address: attraction[:properties][:address_line2], 
        place_id: attraction[:properties][:place_id] 
      }
    end
    attraction_objs.each do |attraction|
      AttractionPoro.new(attraction)
    end
  end
end