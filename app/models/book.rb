class Book < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :author, presence: true

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
