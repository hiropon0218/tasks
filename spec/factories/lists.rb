FactoryBot.define do
  factory :list do
    title   { 'test' }

    association :user
  end
end
