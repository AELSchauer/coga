FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { "#{first_name}#{last_name}" }
    primary_email { "#{first_name.downcase}.#{last_name.downcase}@company.com" }
    password { "password" }
    roles { [] }
  end
end