require "rails_helper"

RSpec.describe ParksController, :type => :controller do
  before(:all) do
    @park = create(:park)
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns parks" do
      get :index
      json_response = JSON.parse(response.body)
      expect(json_response["data"][0].keys).to include("name", "description", "latitude", "longitude")
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: @park.to_param }
      expect(response).to have_http_status(:success)
    end

    it "returns a park" do
      get :show, params: { id: @park.to_param }
      json_response = JSON.parse(response.body)
      expect(json_response["data"].keys).to include("name", "description", "latitude", "longitude")
    end
  end
end
