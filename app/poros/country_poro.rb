class CountryPoro 
  attr_reader :name, :latitude, :longitude

  def initialize(country_data)
    @name = country_data[:name]
    @latitude = country_data[:latitude]
    @longitude = country_data[:longitude]
  end
end