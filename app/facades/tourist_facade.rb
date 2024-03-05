class TouristFacade
  def search_sights_by_lat_lon(lat, lon)
    if right_type?(lat) && right_type?(lon)
      res = TouristEvent.new.find_sites_by_name(name)
      JSON.parse(res.body, symbolize_names: true)
    end
  end

  def right_type?(val)
    val.join(" ").match(/\d+/) && lat.to_i == Integer
  end
end