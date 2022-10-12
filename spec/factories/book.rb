FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    description { Faker::Lorem.words(number: rand(20..50)).join(' ') }
    author { Faker::Book.unique.author }
    price { Faker::Number.decimal(l_digits: 2) }
    category { Book::CATEGORIES.values.sample }
    year_of_publication { rand(1980..2022) }
    dimensions { 'H:6.4\" x W: 0.9\" x D: 5.0' }
    materials { Faker::Commerce.material }
  end
end
