require "rails_helper"

RSpec.describe "SelectedCountryService", :vcr, type: :service do
  before(:each) do 
    @facade = SelectedCountryFacade.new
  end

  context "instance methods" do 
    context "#select_random_country" do
      it "when not provided a country name, it will return a random one" do
        country_name_poro = @facade.select_random_country
        expect(country_name_poro).to be_a CountryNamePoro
        expect(country_name_poro.instance_variables).to eq([:@id, :@name])
        expect(country_name_poro.name).to be_a(String)
        expect(country_name_poro.id).to eq(nil)
      end
    end

    context "#find_country" do
      it "when provided a valid country name, it will return a GeoPoro instance with the country's capital city, latitude, and longitude" do
        capital_geo_poro = @service.find_country
        expect(country_poro).to be_a SelectedCountryPoro
        expect(country_poro.instance_variables).to eq([:@id, :@name])
        expect(country_poro.name).to be_a(String)
        expect(country_poro.id).to eq(nil)
      end
    end
  end
end 