# frozen_string_literal: true

class CartDecorator < Draper::Decorator
  delegate_all
  decorates_association :line_items

  def subtotal_price
    line_items.sum { |item| item.quantity * item.book_price }
  end

  def line_items_number
    try(:line_items_count) || Constants::Shared::EMPTY_CART_ITEMS_COUNT
  end

  def discount
    coupon ? (subtotal_price * coupon.discount).round(2) : Coupon::MIN_DISCOUNT
  end

  def total_price
    subtotal_price - discount
  end
end
