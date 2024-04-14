# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InssService, type: :service do
  subject(:result) { InssService.calculate_contribution(salary) }

  describe '#calculate_contribution' do
    context 'when salary is within the first bracket' do
      let(:salary) { 100_000 }

      it 'calculates INSS contribution correctly' do
        expected_contribution = (salary / 100.0 * 0.075).round(2)

        expect(result[:inss_value]).to eq(expected_contribution)
      end
    end

    context 'when salary is within the second bracket' do
      let(:salary) { 200_000 }

      it 'calculates INSS contribution correctly' do
        expected_contribution = ((1045.00 * 0.075) + ((2000.00 - 1045.00) * 0.09)).round(2)

        expect(result[:inss_value]).to be_within(1).of(expected_contribution)
      end
    end

    context 'when salary is within the third bracket' do
      let(:salary) { 300_000 }

      it 'calculates INSS contribution correctly' do
        expected_contribution = (
          (1045.00 * 0.075) +
          ((2089.60 - 1045.00) * 0.09) +
          ((3000.00 - 2089.60) * 0.12)
        ).round(2)

        expect(result[:inss_value]).to be_within(1).of(expected_contribution)
      end
    end

    context 'when salary exceeds the maximum limit' do
      let(:salary) { 700_000 }

      it 'calculates INSS contribution correctly' do
        expected_contribution = (
          (1045.00 * 0.075) +
          ((2089.60 - 1045.00) * 0.09) +
          ((3134.40 - 2089.60) * 0.12) +
          ((6101.06 - 3134.40) * 0.14)
        ).truncate(2)

        expect(result[:inss_value]).to eq(expected_contribution)
      end
    end
  end
end
