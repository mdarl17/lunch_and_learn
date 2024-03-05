class AttractionPoro 
  attr_reader :name, :address, :place_id

  def initialize(attrs)
    @name = attrs[:name]
    @address = attrs[:latitude]
    @place_id = attrs[:longitude]
  end
end