# frozen_string_literal: true

class Coupon < ApplicationRecord
  MIN_DISCOUNT = 0
  MAX_DISCOUNT = 100

  belongs_to :cart, optional: true
end
