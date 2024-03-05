require "rails_helper"

RSpec.describe "Api::V1::Countries", type: :request do 
  describe "api/v1/countries" do 
    it "returns a country's trivia and facts, including their latitude and longitude position" do
      name = "Italy"
      get search_country_name_path(name), headers: {"CONTENT_TYPE" => "application/json"}, params: { name: name }

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response[:data], symbolize_names: true)

      expect(json_response[:name]).to eq("Italy")
      expect(json_response[:latitude]).to eq(41.9)
      expect(json_response[:longitude]).to eq(12.48)
    end
  end
end 