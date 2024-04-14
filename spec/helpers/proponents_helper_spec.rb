# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProponentsHelper, type: :helper do
  describe '#address_formatted' do
    let(:proponent) do
      Proponent.new(street: 'Rua das Flores', number: '123', city: 'São Paulo', state: 'SP', zip: '12345-678')
    end

    it 'returns formatted address' do
      expect(helper.address_formatted(proponent)).to eq('Rua das Flores, nº 123, São Paulo - SP, 12345-678')
    end
  end
end
