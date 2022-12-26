FactoryBot.define do
  factory :review do
    title { FFaker::HealthcareIpsum.words(2).join('') }
    content { FFaker::CheesyLingo.paragraph }
    rating { rand(ReviewForm::RATING_RANGE) }
    status { Review.statuses.keys.sample }
    book
    user
  end
end
