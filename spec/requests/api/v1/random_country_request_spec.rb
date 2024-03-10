require "rails_helper"

RSpec.describe "Api::V1::countries", :vcr, type: :request do 
  describe "api/v1/countries/name=?" do 
    it "returns returns a random selected country" do
      5.times do
        get selected_country_path
       
        expect(response).to have_http_status(:success)
        country_parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response.body).to be_a String
        expect(country_parsed).to be_a Hash
        expect(country_parsed[:data]).to be_a Hash
        expect(country_parsed[:data][:attributes]).to be_a Hash
        expect(country_parsed[:data][:attributes][:name]).to be_a String
        
        expect(country_parsed.keys).to eq([:data])
        expect(country_parsed[:data].keys).to eq([:id, :type, :attributes])
        expect(country_parsed[:data][:attributes].keys).to eq([:name])

        expect(country_parsed[:data][:id]).to eq(nil)
        expect(country_parsed[:data][:type]).to eq("selected_country")
      end
    end
  end
end