class TouristService
  def find_sites_by_name(name)
    res = conn.get("tourist_sites?country=#{name}")
    JSON.parse(res.body, symbolize_names: true)
  end

  def conn = Faraday.new(url: "/api/v1/") do |faraday|
    faraday.headers[""]
  end
end