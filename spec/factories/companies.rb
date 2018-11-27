FactoryBot.define do
  factory :company do
    name { 'Company' }
    email_domain { "@#{name.downcase}.com" }

    factory :company_with_roles do
      after(:create) do |company, evaluator|
        create(:role, name: :employee, roleable: company)
        create(:role, name: :coordinator, roleable: company)
      end
    end
  end
end
