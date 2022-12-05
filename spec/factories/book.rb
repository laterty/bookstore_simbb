# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
  end
end
