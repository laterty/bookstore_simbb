# frozen_string_literal: true

class Book < ApplicationRecord

  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :author, presence: true

  paginates_per 12

  CATEGORIES = { mobile_development: 'Mobile Development', photo: 'Photo', web_design: 'Web Design' }.freeze

  def self.bestsellers
    Book.all
  end

  def self.category_count(category)
    categorized_books(category).count
  end

  def self.categorized_books(category)
    Book.where(category:)
  end
end
