# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProponentsHelper, type: :helper do
  let(:proponent) do
    build(:proponent, street: 'Rua das Flores', number: 123, city: 'São Paulo', state: 'SP', zip: '12345-678',
                      salary: 1_500_00, inss_discount: 500)
  end

  describe '#address_formatted' do
    it 'returns formatted address' do
      expect(address_formatted(proponent)).to eq('Rua das Flores, nº 123, São Paulo - SP, 12345-678')
    end
  end

  describe '#salary_formatted(proponent)' do
    context 'when salary is present' do
      it 'returns the salary formatted as currency' do
        expect(salary_formatted(proponent)).to eq('R$ 1.500,00')
      end
    end

    context 'when salary is nil' do
      let(:proponent) { Proponent.new(salary: nil) }

      it 'returns zero' do
        expect(salary_formatted(proponent)).to eq(0)
      end
    end
  end

  describe '#inss_discount_formatted(proponent)' do
    context 'when inss_discount is present' do
      it 'returns the inss_discount formatted as currency' do
        expect(inss_discount_formatted(proponent)).to eq('R$ 5,00')
      end
    end

    context 'when inss_discount is nil' do
      let(:proponent) { Proponent.new(inss_discount: nil) }

      it 'returns zero' do
        expect(inss_discount_formatted(proponent)).to eq(0)
      end
    end
  end
end
