class SelectedCountryFacade
  def select_random_country
    service = SelectedCountryService.new
    country = service.get_all.sample
    create_country_poro(country)
  end
  
  def create_country_poro(country_obj)
    country_string = country_obj[:name][:common]
    CountryNamePoro.new(country_string)
  end
end