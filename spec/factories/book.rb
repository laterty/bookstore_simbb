# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    description { Faker::Lorem.words(number: rand(50..70)).join(' ') }
    price { Faker::Number.decimal(l_digits: 2) }
    category { Category.all.sample }
    year_of_publication { rand(1980..2022) }
    dimensions { 'H:6.4\" x W: 0.9\" x D: 5.0' }
    materials { Faker::Commerce.material }
  end
end
