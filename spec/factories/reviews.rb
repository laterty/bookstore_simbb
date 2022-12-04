FactoryBot.define do
  factory :review do
    title { FFaker::HealthcareIpsum.words(2).join('') }
    content { FFaker::CheesyLingo.paragraph }
    rating { rand(0..5) }
    status { 0 }
    book
    user
  end
end
