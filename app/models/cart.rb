# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :books, through: :line_items
  has_one :coupon, dependent: :destroy
end
