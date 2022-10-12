class Book < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :author, presence: true

  CATEGORIES = {mobile_development: 'Mobile Development', photo: 'Photo', web_design: 'Web Design'}.freeze

  def self.bestsellers
    Book.all
  end

  def self.category_count(category)
    Book.where(category:).count
  end
end
