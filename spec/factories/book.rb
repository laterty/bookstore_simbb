# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
  end
end
