# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true

  paginates_per 12
end
