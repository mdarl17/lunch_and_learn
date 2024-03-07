require "rails_helper"

RSpec.describe "Geoapify Places API - tourist site search", :vcr, type: :service do 
  before(:each) do 
    @service = TouristService.new
  end
  describe "TouristService" do :vcr
    it "can search for tourist sites by latitude/longitude of a country's capital city" do

      latvia = {
        # 56.96828070582461, 24.107091065282432  <=  Google Maps
        name: "Latvia",
        lat: 56.95,
        lon: 24.1,
        capital: "Riga"
      }

      france = {
        # 48.85724432297121, 2.3521818469648044  <=  Google Maps
        name: "France",
        lat: 46.0,
        lon: 2.0,
        capital: "Paris"
      }

      new_zealand = {
       # -41.29309578252113, 174.7775899000268  <=  Google Maps
        name: "New Zealand",
        lat: -41.3,
        lon: 174.78,
        capital: "Wellington"
      }

      happy_countries = ["Latvia", "New Zealand", "France"]
      
      happy_countries.each do |country|
        attractions = TouristFacade.new.find_local_attractions(country)
        expect(attractions).to respond_to
        expect(attractions.length).to eq(10)

        attractions.each.with_index do |attraction, i|
          expect(attraction.instance_variables).to eq([:@id, :@type, :@name, :@address, :@place_id])
          expect(attraction.instance_variables.count).to eq(5)
          expect(attraction).to be_a AttractionPoro
          expect(attraction.id).to eq(nil)
          expect(attraction.type).to eq("tourist_site")
        end
      end
    end
  end
end 