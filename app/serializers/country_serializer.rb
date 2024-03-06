class CountrySerializer
  include JSONAPI::Serializer

  attributes :id, :name, :latitude, :longitude
end
