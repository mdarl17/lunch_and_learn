require "rails_helper"

RSpec.describe "Selected Country Facade", :vcr, type: :facade do 
  before(:each) do 
    @facade = SelectedCountryFacade.new
  end

  describe "#selected_country" do
    it "randomly selects one country object from the entire database of country objects (represented as JSON)" do
      selected_country = @facade.select_random_country
      expect(selected_country).to be_a SelectedCountryPoro
      expect(selected_country.name).to be_a String
    end
  end

  describe "#create_country_poro" do 
    it "given a country's name it will create a SelectedCountryPoro" do
      country_hash = TestData::COUNTRY
      selected_country_poro = @facade.create_country_poro(country_hash)
      expect(selected_country_poro).to be_a SelectedCountryPoro
      expect(selected_country_poro.id).to eq(nil)
      expect(selected_country_poro.name).to eq("Western Sahara")
    end
  end
end