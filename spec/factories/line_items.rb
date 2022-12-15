FactoryBot.define do
  factory :line_item do
    cart
    book
    quantity { rand(1..10) }
  end
end
