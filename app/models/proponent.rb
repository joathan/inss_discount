# frozen_string_literal: true

class Proponent < ApplicationRecord
  store_accessor :address, :zip, :street, :city, :state, :number

  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true

  before_save :remove_salary_formatting

  def formatted_salary
    if salary.present?
      salary_in_reais = salary / 100.0
      ActionController::Base.helpers.number_to_currency(salary_in_reais, unit: 'R$', separator: ',', delimiter: '.', format: '%u %n')
    else
      nil
    end
  end

  def salary=(value)
    value = value.to_s.gsub(/[^\d]/, '').to_i

    self[:salary] = value
  end

  def address_formatted
    "#{street}, nº #{number}, #{city} - #{state}, #{zip}"
  end

  private

  def remove_salary_formatting
    self.salary = salary.to_s.gsub(/[^\d]/, '').to_i
  end
end
