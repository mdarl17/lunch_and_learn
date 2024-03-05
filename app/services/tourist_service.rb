class TouristService
  def find_attractions_with_lat_and_lon(lat, lon)
    res = conn.get("places?categories=tourism.attraction&lat=#{lat}&lon=#{lon}&limit=10")
    JSON.parse(res.body, symbolize_names: true)
  end

  def conn = Faraday.new(url: "https://api.geoapify.com/v2/") do |faraday|
    faraday.params["apiKey"] = Rails.application.credentials.places_api[:key]
  end
end