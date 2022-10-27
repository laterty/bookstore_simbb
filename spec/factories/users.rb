FactoryBot.define do
  factory :user do
    id { rand(1..20) }
    email { Faker::Internet.email }
    password { 'Yo123L**o321' }
  end
end
