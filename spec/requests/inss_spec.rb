# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Insses', type: :request do
  describe 'GET /calculate' do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'returns http success' do
      get '/inss/calculate', params: { salary: "2000" }

      expect(response).to have_http_status(:success)
    end
  end
end
