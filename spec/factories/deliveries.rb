FactoryBot.define do
  factory :delivery do
    delivery_method { FFaker::BaconIpsum.word }
    price { rand(10) }
    time { ['1 day', '6 days', '1 week', 'from 2 to 5 days'].sample }
  end
end
