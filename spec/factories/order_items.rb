FactoryBot.define do
  factory :order_item do
    order
    book
    quantity { rand(1..10) }
  end
end
