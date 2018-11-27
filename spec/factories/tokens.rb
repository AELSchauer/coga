FactoryBot.define do
  factory :token do
    name { 1 }
    token { "MyString" }
    user { nil }
  end
end
