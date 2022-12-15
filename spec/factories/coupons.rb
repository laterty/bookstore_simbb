FactoryBot.define do
  factory :coupon do
    discount { rand(0..0.99).round(2) }
    code { FFaker::BaconIpsum.word }
  end
end
