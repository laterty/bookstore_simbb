# frozen_string_literal: true

class OrderDecorator < Draper::Decorator
  delegate_all
  decorates_association :order_items

  def subtotal_price
    order_items.sum { |item| item.quantity * item.price }
  end

  def discount_price
    discount ? (subtotal_price * discount / Coupon::MAX_DISCOUNT).round(2) : Coupon::MIN_DISCOUNT
  end

  def total_price
    subtotal_price - discount
  end
end
