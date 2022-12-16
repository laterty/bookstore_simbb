# frozen_string_literal: true

class CartDecorator < Draper::Decorator
  delegate_all
  decorates_association :line_items

  def subtotal_price
    line_items.sum { |item| item.quantity * item.book_price }
  end

  def discount
    coupon ? (subtotal_price * coupon.discount / Coupon::MAX_DISCOUNT).round(2) : Coupon::MIN_DISCOUNT
  end

  def total_price
    subtotal_price - discount
  end
end
