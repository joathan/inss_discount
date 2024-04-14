# frozen_string_literal: true

class InssService
  def self.calculate_contribution(salary_cents)
    salary = salary_cents / 100.0

    # 2020 rates and limits
    brackets = [
      { limit: 1045.00, rate: 0.075 },
      { limit: 2089.60, rate: 0.09 },
      { limit: 3134.40, rate: 0.12 },
      { limit: 6101.06, rate: 0.14 }
    ]

    total_contribution = 0.0
    previous_limit = 0.0

    brackets.each do |bracket|
      if salary > previous_limit
        current_contribution = [bracket[:limit], salary].min - previous_limit
        total_contribution += (current_contribution * bracket[:rate]) # .round(2) if needed
        previous_limit = bracket[:limit]
      end
    end

    effective_rate = total_contribution / salary
    { effective_rate: effective_rate, inss_value: total_contribution.truncate(2) }
  end
end
