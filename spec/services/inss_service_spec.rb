# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InssService, type: :service do
  describe '#calculate_contribution' do
    describe '2020 rates and limits' do
      context 'when salary is within the first bracket' do
        it 'calculates INSS contribution correctly' do
          salary = 1000.00 * 100
          expected_contribution = (salary / 100.0 * 0.075).round(2)
          result = InssService.calculate_contribution(salary)

          expect(result[:inss_value]).to eq(expected_contribution)
        end
      end

      context 'when salary is within the second bracket' do
        it 'calculates INSS contribution correctly' do
          salary = 200000
          expected_contribution = (1045.00 * 0.075 + (2000.00 - 1045.00) * 0.09).round(2)
          result = InssService.calculate_contribution(salary)

          expect(result[:inss_value]).to be_within(1).of(expected_contribution)
        end
      end

      context 'when salary is within the third bracket' do
        it 'calculates INSS contribution correctly' do
          salary = 300000
          expected_contribution = (
            (1045.00 * 0.075).round(2) +
            ((2089.60 - 1045.00) * 0.09).round(2) +
            ((3000.00 - 2089.60) * 0.12).round(2)
          ).round(2)
          result = InssService.calculate_contribution(salary)

          expect(result[:inss_value]).to be_within(1).of(expected_contribution)
        end
      end

      context 'when salary exceeds the maximum limit' do
        it 'calculates INSS contribution correctly' do
          salary = 700000
          expected_contribution = (
            (1045.00 * 0.075).round(2) +
            ((2089.60 - 1045.00) * 0.09).round(2) +
            ((3134.40 - 2089.60) * 0.12).round(2) +
            ((6101.06 - 3134.40) * 0.14).round(2)
          ).truncate(2)
          result = InssService.calculate_contribution(salary)

          expect(result[:inss_value]).to eq(expected_contribution)
        end
      end
    end
  end
end
