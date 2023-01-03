FactoryBot.define do
  factory :credit_card do
    number { 1 }
    name { "MyString" }
    cvv { 1 }
    expire_date { "MyString" }
  end
end
