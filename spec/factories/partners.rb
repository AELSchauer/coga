FactoryBot.define do
  factory :partner do
    name { 'Partner' }
    email_domain { nil }

    trait :with_domain do
      email_domain { "@#{name.downcase}.com" }
    end
  end
end
