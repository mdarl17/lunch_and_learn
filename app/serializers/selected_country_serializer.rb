class SelectedCountrySerializer
  include JSONAPI::Serializer
  
  attributes :name

  # def initialize(country_name)
  #   @name = country_name
  # end

  # def serialize_json
  #   {
  #     "data": {
  #       "attributes": [
  #         {
  #           "name": "#{@name}"
  #         }
  #       ]
  #     }
  #   }
  # end
end
