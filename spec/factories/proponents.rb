# frozen_string_literal: true

FactoryBot.define do
  factory :proponent do
    name { Faker::Name.name }
    cpf { Faker::IdNumber.brazilian_citizen_number }
    address do
      {
        zip: Faker::Address.zip_code,
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        number: Faker::Address.building_number
      }
    end
    salary { rand(100_000..1_500_000) }
    inss_discount { rand(10_000..100_000) }
  end
end
