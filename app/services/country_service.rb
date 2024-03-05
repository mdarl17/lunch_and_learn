class CountryService 
  def search_name(name)
    response = conn.get("name/#{name}")
    JSON.parse(response.body, symbolize_names: true)
  end

    def conn 
      Faraday.new(url: "https://restcountries.com/v3.1/") do |faraday| 
        faraday.headers[{ "Content-Type" => "application/json", "Accept" => "application/json" }]
      end
    end
end