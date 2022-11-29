# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    first_name { 'yolo' } # FFaker::Name.first_name }
    last_name { 'polo' } # FFaker::Name.last_name }
    address { 'colo' } # FFaker::Address.street_name }
    city { 'tolo' } # FFaker::Address.city }
    zip { 123456 } # FFaker::Address.zip_code }
    country { 'UA' }
    phone { '+380671234567' }
    user

    trait :shipping_address do
      type { 'ShippingAddress' }
    end

    trait :billing_address do
      type { 'BillingAddress' }
    end
  end
end
