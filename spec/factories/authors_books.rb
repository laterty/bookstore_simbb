# frozen_string_literal: true

FactoryBot.define do
  factory :authors_book do
    book { Book.all.sample }
    author { Author.all.sample }
  end
end
