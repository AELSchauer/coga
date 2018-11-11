FactoryBot.define do
  factory :role do
    type { 'employee' }
    user { nil }
    roleable { nil }
  end
end
