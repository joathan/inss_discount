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
    salary { rand(100000..1500000) }
    inss_discount { rand(10000..100000) }
  end
end
