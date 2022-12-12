FactoryBot.define do
  factory :line_item do
    order
    book
    quantity { rand(1..10) }
  end
end
