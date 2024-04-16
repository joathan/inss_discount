# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Insses', type: :request do
  describe 'GET /calculate' do
    it 'returns http success' do
      get '/inss/calculate'

      expect(response).to have_http_status(:success)
    end
  end
end
