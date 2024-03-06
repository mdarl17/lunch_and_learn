class AttractionPoro 
  attr_reader :type, :name, :address, :place_id

  def initialize(attrs)
    @type = "tourist_site"
    @name = attrs[:name]
    @address = attrs[:latitude]
    @place_id = attrs[:longitude]
  end
end