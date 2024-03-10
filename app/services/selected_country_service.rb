class SelectedCountryService
  def get_all
    get_url("all")
  end

  def find_by_name(name)
    get_url("/name/#{name}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://restcountries.com/v3.1/") do |faraday|
      faraday.headers[{ "Content-Type": "application/json" }]
      faraday.headers[{ "Accept": "application/json" }]
    end
  end
end