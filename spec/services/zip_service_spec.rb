# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ZipService, type: :service do
  subject(:result) { service.call }

  describe '#call' do
    let(:zip) { '01001-000' }
    let(:api_url) { "https://viacep.com.br/ws/#{zip}/json" }
    let(:service) { ZipService.new(zip) }

    context 'when the zip code is valid' do
      before do
        stub_request(:get, api_url)
          .to_return(status: 200, body: { logradouro: 'Praça da Sé', localidade: 'São Paulo' }.to_json)
      end

      it 'returns the address information' do
        expect(result['logradouro']).to eq('Praça da Sé')
        expect(result['localidade']).to eq('São Paulo')
      end
    end

    context 'when the zip code is invalid' do
      before do
        stub_request(:get, api_url)
          .to_return(status: 400)
      end

      it 'raises a StandardError with "CEP inválido"' do
        expect { result }.to raise_error(StandardError, 'CEP inválido')
      end
    end

    context 'when there is a timeout' do
      before do
        stub_request(:get, api_url)
          .to_raise(Timeout::Error)
      end

      it 'raises a StandardError with "Tempo de requisição excedido"' do
        expect { result }.to raise_error(StandardError, 'Tempo de requisição excedido')
      end
    end
  end
end
