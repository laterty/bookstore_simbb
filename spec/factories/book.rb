# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    description { "#{FFaker::CheesyLingo.paragraph} #{FFaker::CheesyLingo.paragraph}" }
    price { rand(0..100.0).round(2) }
    category
    year_of_publication { rand(1980..2022) }
    dimensions { 'H:6.4\" x W: 0.9\" x D: 5.0' }
    materials { FFaker::BaconIpsum.word }
    cover_image do
      path = Rails.root.join('spec/images/cover_image.jpg')
      Rack::Test::UploadedFile.new(path, 'image/jpg')
    end
    images do
      path = Rails.root.join('spec/images/images.jpg')
      [Rack::Test::UploadedFile.new(path, 'image/jpg')] * rand(1..3)
    end
    quantity { rand(3..50) }
  end
end
