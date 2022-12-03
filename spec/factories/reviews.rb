FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyText" }
    rating { rand(0..5) }
    status { 0 }
    book
    user
  end
end
