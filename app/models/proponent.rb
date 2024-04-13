class Proponent < ApplicationRecord
  store_accessor :address, :zip, :street, :city, :state, :number

  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true
end
