FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    description { Faker::Lorem.words(number: rand(10..30)).join(' ') }
    author { Faker::Book.unique.author }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
