require "rails_helper"

RSpec.describe "Geoapify Places API - tourist site search", vcr: true, type: :service do 
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
        expect(attractions).to be_a Array
        expect(attractions.length).to eq(10)

        attractions.each.with_index do |attraction, i|
          expect(attraction.keys).to eq([:id, :type, :name, :address, :place_id])
          expect(attraction.keys.count).to eq(5)
          expect(attraction).to be_a Hash
          if country == "Latvia"
            expect(attractions[i][:id]).to eq("null")
            expect(attractions[i][:type]).to eq("tourist_site")
            expect(attractions[i][:name]).to eq(attraction[:name])
            # expect(attraction[:address]).to eq("11. novembra krastmala, Riga, LV-1050, Latvia")
            # expect(attraction[:place_id]).to eq("51c0b8af5ea0193840598f297d748f794c40f00103f9014c3c2b4d000000009203104c69656c616973204b72697374617073")
            # distance threshold for capital (lat/lon) and each attraction? Within certain distance? Need to look closer at docs and more cleverly to figure this test out
            # latvia_lat_long = [find_local_attractions("Latvia")[:lat], find_local_attractions(name)[:lon]]
          end
        end
        
        # if country == "France"
        #   expect(attraction[:name]).to eq
        #   expect(attraction[:address]).to eq
        #   expect(attraction[:place_id]).to eq("51c0b8af5ea0193840598f297d748f794c40f00103f9014c3c2b4d000000009203104c69656c616973204b72697374617073")
        # end
      end
    end
  end

end 