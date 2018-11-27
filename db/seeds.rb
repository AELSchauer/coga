# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_initialize_by(
  first_name: 'Ashley',
  last_name: 'Schauer',
  primary_email: 'aelschauer@boc.com',
  username: 'aelschauer',
)
user.password = 'password'
user.save

company = Company.find_or_create_by(
  name: 'Big Oil Company',
  email_domain: '@boc.com'
)
Role.create(name: :employee, roleable: company)
Role.create(name: :coordinator, roleable: company)

20.times do
  company_name = "#{Faker::Name.last_name} #{Faker::Name.last_name}"
  company = Company.find_or_create_by(
    name: company_name,
    email_domain: "@#{company_name.parameterize}.com"
  )
  Role.create(name: :employee, roleable: company)
  Role.create(name: :coordinator, roleable: company)
end