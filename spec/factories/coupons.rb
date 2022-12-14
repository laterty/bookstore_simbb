FactoryBot.define do
  factory :coupon do
    discount { rand(0..0.99).round(2) }
    code { "MyString" }
  end
end
