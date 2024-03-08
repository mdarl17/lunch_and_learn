require "rails_helper"
RSpec.describe "REST countries API search", :vcr, type: :service do 
  describe "CountryService" do 
    before(:each) do 
      @service = RandomCountryService.new
    end

    describe "#get_country_by_name" do
      scenario "user submits valid country name", :vcr do
        json_response = @service.tourist_sights_with_country_name("usa")
        lat_long = json_response[0][:capitalInfo]
        expect(json_response).to be_an Array
        expect(lat_long.class).to be_a Hash
        expect(lat_long.count).to eq(1)
        expect(lat_long.keys).to eq([:latlng])
        expect(lat_long.keys.count).to eq(1)
        expect(json_response.first[:name][:common]).to eq("United States")
        expect(json_response.first[:capitalInfo][:latlng]).to eq([38.89, -77.05])
      end
    end
  end
end