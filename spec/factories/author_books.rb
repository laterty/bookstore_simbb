# frozen_string_literal: true

FactoryBot.define do
  factory :author_book do
    book
    author
  end
end
