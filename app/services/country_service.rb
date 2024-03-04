class CountryService 
  def get_country_by_name(country_name)

    get_url("name/#{country_name}")
  end
 
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  private 

  def conn 
    Faraday.new(url: "https://restcountries.com/v3.1/") do |faraday| 
      faraday.headers[{ "Content-Type" => "application/json", "Accept" => "application/json" }]
    end
  end
end