# frozen_string_literal: true

# Path: app/helpers/proponents_helper.rb
module ProponentsHelper
  def address_formatted(proponent)
    return nil if proponent.address.blank?

    "#{proponent.street}, nº #{proponent.number}, #{proponent.city} - #{proponent.state}, #{proponent.zip}"
  end

  def inss_discount_formatted(proponent)
    return 0 if proponent.inss_discount.blank?

    inss_in_reais = proponent.inss_discount / 100.0
    number_formatter(inss_in_reais)
  end

  def salary_formatted(proponent)
    return 0 if proponent.salary.blank?

    salary_in_reais = proponent.salary / 100.0
    number_formatter(salary_in_reais)
  end

  def simplify_name(proponent)
    parts = proponent.name.split
    
    return proponent.name if parts.size < 2

    "#{parts.first} #{parts.last}"
  end

  private

  def number_formatter(value)
    number_to_currency(value,
                       unit: 'R$',
                       separator: ',',
                       delimiter: '.',
                       format: '%u %n')
  end
end
