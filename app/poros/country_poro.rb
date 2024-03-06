class CountryPoro 
  attr_reader :id, :name, :latitude, :longitude

  def initialize(country_data)
    @id = country_data[:id]
    @name = country_data[:name]
    @latitude = country_data[:latitude]
    @longitude = country_data[:longitude]
  end
end