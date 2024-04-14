# frozen_string_literal: true

# Path: app/models/proponent.rb
class Proponent < ApplicationRecord
  store_accessor :address, :zip, :street, :city, :state, :number

  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true

  def formatted_salary
    return nil if salary.blank?

    salary_in_reais = salary / 100.0
    ActionController::Base.helpers.number_to_currency(salary_in_reais, unit: 'R$', separator: ',', delimiter: '.',
                                                                       format: '%u %n')
  end

  def salary=(value)
    cleaned_salary = value.to_s.gsub(/[^\d]/, '').to_i
    super(cleaned_salary)
  end
end
