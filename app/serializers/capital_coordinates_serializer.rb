class CapitalCoordinatesSerializer
  include JSONAPI::Serializer
  
  attributes :name, :latitude, :longitude
end

