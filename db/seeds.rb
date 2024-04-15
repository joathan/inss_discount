Faker::Config.default_locale = :"pt-BR"

User.delete_all
Proponent.delete_all

User.create!(
  email: 'admin@inss.com.br',
  password: '123123'
)

50.times do |i|
  Proponent.create!(
    name: Faker::Name.name,
    cpf: Faker::IdNumber.brazilian_citizen_number,
    address: {
      street: Faker::Address.street_name,
      number: Faker::Address.building_number,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip: Faker::Address.zip_code
    },
    salary: Faker::Number.between(from: 100000, to: 1000000),
    inss_discount: 100 + i
  )
end
