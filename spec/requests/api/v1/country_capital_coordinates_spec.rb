require "rails_helper"

RSpec.describe "Api::V1::capital_coordinates", :vcr, type: :request do 
  describe "api/v1/countries/name=?" do 
    it "returns returns the latitude and longitude coordinates of a country's capital city" do
      happy_countries = ["Latvia", "France", "New Zealand"]
      
      happy_countries.each.with_index do |country, i|
        # get capital_coordinates_path, headers: {"CONTENT_TYPE" => "application/json", "Accept": "application/json"},
        #                               params: { name: happy_countries[i] }
        get capital_coordinates_path, headers: {"CONTENT_TYPE" => "application/json", "Accept": "application/json"},
                                   params: { name: happy_countries[i] }

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body, symbolize_names: true)

        if country == "Latvia"
          expect(json_response[:data][:id]).to eq(nil)
          expect(json_response[:data][:attributes][:latitude]).to eq(56.95)
          expect(json_response[:data][:attributes][:longitude]).to eq(24.1)
        end

        if country == "France"
          expect(json_response[:data][:id]).to eq(nil)
          expect(json_response[:data][:attributes][:latitude]).to eq(48.87)
          expect(json_response[:data][:attributes][:longitude]).to eq(2.33)
        end

        if country == "New Zealand"
          expect(json_response[:data][:id]).to eq(nil)
          expect(json_response[:data][:attributes][:latitude]).to eq(-41.3)
          expect(json_response[:data][:attributes][:longitude]).to eq(174.78)
        end
      end
    end
  end
end