class CountryNamePoro 
  attr_reader :id, :type, :name

  def initialize(name)
    @id = nil
    @name = name
  end
end