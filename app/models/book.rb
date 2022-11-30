# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

  validates :title, :description, :price, :year_of_publication, :materials, :dimensions, presence: true
  validates :price, numericality: { greater_than: 0 }
end
