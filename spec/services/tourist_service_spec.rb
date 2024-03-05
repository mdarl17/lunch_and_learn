require "rails_helper"

RSpec.describe "Geoapify Places API - tourist site search" do 
  before(:each) do 
    @service = TouristService.new
  end
  describe "TouristService" do 
    it "can search for tourist sites by latitude/longitude of a country's capital city" do 
      latvia = "Latvia"
      # new_zealand = "New Zealand"
      france = "France"
      # attractions = TouristFacade.new.find_local_attractions(latvia)
      # expect(search_response).to be_a Hash
      # expect(search_response[:data]).to be_a Array
      expect(search_response[:data].count).to eq(10) 
      # expect(search_response[:data].first.country).to_not eq("United States") 
    end
  end
  
end 