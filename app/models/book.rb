# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :author, presence: true

  def self.bestsellers
    Book.all
  end
end
