class Proponent < ApplicationRecord
  store_accessor :address, :zip, :street, :city, :state, :number

  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: :all_blank
end
