# frozen_string_literal: true

class CouponForm < ApplicationForm
  attr_accessor :cart_id

  validate :carts_uniqueness

  private

  def carts_uniqueness
    errors.add(:cart_id, message: 'coupon has been already takken!!!') if @model.cart
  end
end
