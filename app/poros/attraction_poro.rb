class AttractionPoro 
  attr_reader :id, :type, :name, :address, :place_id

  def initialize(attrs)
    @id = nil
    @type = "tourist_site"
    @name = attrs[:name]
    @address = attrs[:address]
    @place_id = attrs[:place_id]
  end
end