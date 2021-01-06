FactoryBot.define do
  factory :user do
      name       { 'test' }
      email      { 'test@test' }
      password   { '123abc' }
  end
end
