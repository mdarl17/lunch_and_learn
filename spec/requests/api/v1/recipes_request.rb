require "rails_helper"

RSpec.describe "Api::V1::Recipes" do 
  describe "api/v1/recipes" do 
    it "sends a list of recipes from a specific country" do
      require 'pry'; binding.pry
      country_random = JSON.parse(res, symbolize_names: true)
        .keys.select { |key, value| key == :name }
        .sample
        require 'pry'; binding.pry
      create_list(:recipes, 5)
      create(:country)

      get "/api/v1/recipes?countries=#{country}"
    end
  end
end