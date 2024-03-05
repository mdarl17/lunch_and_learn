class CountrySerializer
    attr_reader :name, :latitude, :longitude
  def initialize(country_poro)
    @name = country_poro.name
    @latitude = country_poro.latitude
    @longitude = country_poro.longitude
  end
  
    def serialize_json
        {
          "data": [
            {
              "name": "#{@name}",
              "latitude": "#{@latitude}",
              "longitude": "#{@longitude}"
            }
          ]
        }
    end
end