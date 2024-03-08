require "rails_helper"

RSpec.describe "Api::V1::countries", :vcr, type: :request do 
  describe "api/v1/countries/name=?" do 
    it "returns a country's trivia and facts, including their latitude and longitude position" do
      happy_countries = ["Latvia", "France", "New Zealand"]
      
      happy_countries.each do |country|
        get search_country_name_path, headers: {"CONTENT_TYPE" => "application/json" }, params: { name: country }
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