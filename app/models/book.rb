# frozen_string_literal: true

class Book < ApplicationRecord
  MIN_PRICE_VALUE = 0

  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :reviews, dependent: :destroy

  validates :title, :description, :price, :year_of_publication, :materials, :dimensions, presence: true
  validates :price, numericality: { greater_than: MIN_PRICE_VALUE }
end
