# frozen_string_literal: true

# Calculates the INSS contribution based on the given salary.
class InssService
  # 2020 rates and limits
  INSS_CONFIG = [
    { limit: 1045.00, rate: 0.075 },
    { limit: 2089.60, rate: 0.09 },
    { limit: 3134.40, rate: 0.12 },
    { limit: 6101.06, rate: 0.14 }
  ].freeze

  # Calculates the INSS contribution based on the given salary.
  #
  # @param salary_cents [Integer] The salary in cents.
  # @return [Hash] A hash containing the effective rate and the INSS value.
  def self.calculate_contribution(salary_cents, total_contribution: 0.0, previous_limit: 0.0)
    salary = salary_cents / 100.0

    INSS_CONFIG.each do |bracket|
      next unless salary > previous_limit

      current_contribution = [bracket[:limit], salary].min - previous_limit
      total_contribution += (current_contribution * bracket[:rate])
      previous_limit = bracket[:limit]
    end

    effective_rate = total_contribution / salary
    { effective_rate:, inss_value: total_contribution.truncate(2) }
  end
end
