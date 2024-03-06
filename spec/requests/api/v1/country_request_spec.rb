require "rails_helper"

RSpec.describe "Api::V1::countries", :vcr, type: :request do 
  describe "api/v1/name" do 
    it "returns a country's trivia and facts, including their latitude and longitude position" do
      @name = "Italy"
      get search_country_name_path(@name), headers: {"CONTENT_TYPE" => "application/json"}
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response[:data][:attributes][:name]).to eq("Italy")
      expect(json_response[:data][:attributes][:latitude].to_f).to eq(41.9)
      expect(json_response[:data][:attributes][:longitude].to_f).to eq(12.48)
    end
  end
end 