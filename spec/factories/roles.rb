FactoryBot.define do
  factory :role do
    type { 'employee' }
    roleable { nil }
  end
end
