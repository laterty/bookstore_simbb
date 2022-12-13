# frozen_string_literal: true

class LineItem < ApplicationRecord
  MIN_QUANTITY = 1

  belongs_to :book
  belongs_to :cart

  validates :quantity, numericality: { greater_than_or_equal_to: MIN_QUANTITY }
end