require "rails_helper"

RSpec.describe "Api::V1::Countries", type: :request do 
  describe "api/v1/countries" do 
    it "returns a country's trivia and facts, including their latitude and longitude position" do
      name = "Italy"
      get "api/v1/country?name=#{name}"
    end
  end
end 