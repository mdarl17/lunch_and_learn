require "rails_helper"

RSpec.describe "RandomCountryService", :vcr, type: :service do 
  context "class methods" do 
    context "#lat_lon_by_country_name" do 
      it "returns recipe data" do 
        json = RandomCountryService.new.lat_lon_by_country_name("New Zealand")
        
        expect(json).to be_an Array
        expect(json[0]).to be_a Hash
        expect(json.first[:name][:common].capitalize).to eq("New Zealand".capitalize)
        expect(json.first[:name][:common]).to be_a(String)
        expect(json.first[:name].keys).to eq([:common, :official, :nativeName])
      end
    end
  end
end 