# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    phone { [Faker::PhoneNumber.cell_phone, Faker::PhoneNumber.phone_number].sample }
    kind { %W[personal reference].sample }
    proponent
  end
end
