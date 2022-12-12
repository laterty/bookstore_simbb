# frozen_string_literal: true

class Book < ApplicationRecord
  MIN_PRICE_VALUE = 0
  MIN_QUANTITY = 1

  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :reviews, dependent: :destroy

  validates :title, :description, :price, :year_of_publication, :materials, :dimensions, :quantity, presence: true
  validates :price, numericality: { greater_than: MIN_PRICE_VALUE }

  mount_uploaders :images, BookImageUploader
  mount_uploader :cover_image, BookImageUploader
end
