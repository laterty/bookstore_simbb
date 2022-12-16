FactoryBot.define do
  factory :coupon do
    discount { rand(0..100) }
    code { FFaker::BaconIpsum.word }
  end
end
