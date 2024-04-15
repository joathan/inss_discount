# frozen_string_literal: true

# Path: app/models/proponent.rb
class Proponent < ApplicationRecord
  store_accessor :address, :zip, :street, :city, :state, :number

  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true

  def self.salary_distribution
    select(
      "(CASE WHEN salary / 100.0 <= 1045 THEN 'Até R$ 1.045,00' WHEN salary / 100.0 > 1045 AND salary / 100.0 <= 2089.60 THEN 'De R$ 1.045,01 a R$ 2.089,60' WHEN salary / 100.0 > 2089.60 AND salary / 100.0 <= 3134.40 THEN 'De R$ 2.089,61 até R$ 3.134,40' WHEN salary / 100.0 > 3134.40 AND salary / 100.0 <= 6101.06 THEN 'De R$ 3.134,41 até R$ 6.101,06' ELSE 'Acima de R$ 6.101,06' END) as salary_range, COUNT(*) as count")
    .group('salary_range')
    .order(Arel.sql('MIN(salary / 100.0)'))
    .each_with_object({}) { |proponent, hash| hash[proponent.salary_range] = proponent.count }
  end

  def salary=(value)
    cleaned_salary = value.to_s.gsub(/[^\d]/, '').to_i
    super(cleaned_salary)
  end

  def inss_discount=(value)
    cleaned_inss_discount = value.to_s.gsub(/[^\d]/, '').to_f
    super(cleaned_inss_discount)
  end
end
