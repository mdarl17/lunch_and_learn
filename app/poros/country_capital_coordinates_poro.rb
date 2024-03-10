class CountryCapitalCoordinatesPoro
  attr_reader :id, :name, :latitude, :longitude

  def initialize(lat_long_data)
    @id = nil
    @type = "capital_geolocation"
    @name = lat_long_data[:name]
    @latitude = lat_long_data[:latitude]
    @longitude = lat_long_data[:longitude]
  end
end