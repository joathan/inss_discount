require 'rails_helper'

RSpec.describe "Zips", type: :request do
  describe "GET /search" do
    it "returns http success" do
      get "/zip/search?zip=01311000"

      expect(response).to have_http_status(:success)
    end
  end
end
