FactoryBot.define do
  factory :company do
    name { 'Company' }
    email_domain { nil }

    trait :with_domain do
      email_domain { "@#{name.downcase}.com" }
    end
  end
end
