class AttractionSerializer
  include JSONAPI::Serializer

  attributes :id, :type, :name, :address, :place_id

  data do |attraction|
    {
      id: nil,
      type: "tourist_site",
      attributes: {
        name: attrraction.name,
        address: attrraction.address,
        place_id: attrraction.place_id
      }
    }
  end
end

