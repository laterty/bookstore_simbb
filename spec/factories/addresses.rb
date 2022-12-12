# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    first_name { FFaker::Name.first_name.gsub(/[.,'\-]/, '') }
    last_name { FFaker::Name.last_name.gsub(/[.,'\-]/, '') }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city.gsub(/[.,'\-]/, '') }
    zip { FFaker::AddressUA.zip_code }
    country { FFaker::Address.country.gsub(/[.,'\-]/, '') }
    phone { FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[ \-]/, '') }
    user

    trait :shipping_address do
      type { 'ShippingAddress' }
    end

    trait :billing_address do
      type { 'BillingAddress' }
    end
  end
end
