FactoryBot.define do
  factory :user do
    username { 'JoeSchmoe' }
    first_name { 'Joe' }
    last_name { 'Schmoe' }
    company_email { 'joe.schmoe@company.com' }
    roles { nil }
  end
end