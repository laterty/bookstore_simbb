# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    description { "#{FFaker::CheesyLingo.paragraph} #{FFaker::CheesyLingo.paragraph}" }
    price { rand(0..100.0).round(2) }
    category
    year_of_publication { rand(1980..2022) }
    dimensions { 'H:6.4\" x W: 0.9\" x D: 5.0' }
    materials { FFaker::BaconIpsum.word  }
  end
end
