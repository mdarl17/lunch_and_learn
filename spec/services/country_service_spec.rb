require "rails_helper"
RSpec.describe "REST countries API search" do 
  describe "CountryService" do 
    before(:each) do 
      @service = CountryService.new
    end

    describe "#get_country_by_name" do
      scenario "user submits valid country name", :vcr do
        search = @service.get_country_by_name("usa")
        expect(search).to be_a Array
        expect(search.first).to be_a Hash
        expect(search.first[:name][:common]).to eq("United States")
        expect(search.first[:capitalInfo][:latlng]).to eq([38.89, -77.05])
      end
    end   
  end
end