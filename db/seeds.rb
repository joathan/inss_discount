Faker::Config.default_locale = :"pt-BR"

User.delete_all
Proponent.all.each(&:destroy)

50.times do |i|
  proponent = Proponent.create!(
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

  rand(1..3).times do
    proponent.contacts.create!(
      kind: ['reference', 'personal'].sample,
      phone: Faker::PhoneNumber.cell_phone
    )
  end
end

User.create!(
  email: 'admin@inss.com.br',
  password: '123123'
)
