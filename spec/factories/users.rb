FactoryBot.define do
  factory :user do
    username { 'JoeSchmoe' }
    first_name { 'Joe' }
    last_name { 'Schmoe' }
    primary_email { 'joe.schmoe@company.com' }
    roles { nil }
  end
end