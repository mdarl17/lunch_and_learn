require "rails_helper"

RSpec.describe "Api::V1::Recipes" do 
  describe "api/v1/recipes" do 
    it "gets the latitude and longitude of a country" do 
      get "/localhost:3000/"
    end 

    it "sends a list of recipes from a specific country" do
      create_list(:recipes, 5)
      
    end
  end
end