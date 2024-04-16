# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Zips', type: :request do
  describe 'GET /search', :vcr do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'returns http success' do
      get '/zip/search?zip=01311000'

      expect(response).to have_http_status(:success)
    end
  end
end
