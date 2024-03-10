class CountryCapitalCoordinatesFacade
  def find_country(name)
    name_transcoded = transcode_name(name)
    service = CountryCapitalCoordinatesService.new
    country = service.find_country_by_name(name_transcoded)
    filter_capital(country)
  end

  def filter_capital(country)
    capital_name = country.first[:capital].first
    lat = country.first[:capitalInfo][:latlng].first
    lon = country.first[:capitalInfo][:latlng].second

    CountryCapitalCoordinatesPoro.new(name: capital_name, latitude: lat, longitude: lon)
  end

  def transcode_name(name)
    return name if name.split(" ").length == 1
    name.gsub(/\s+/, "%20")
  end
end