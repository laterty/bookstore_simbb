# frozen_string_literal: true

FactoryBot.define do
  factory :authors_book do
    association :book
    association :author
  end
end
