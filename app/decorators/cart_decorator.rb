# frozen_string_literal: true

class CartDecorator < Draper::Decorator
  delegate_all
  decorates_association :line_items

  def subtotal_price
    line_items.sum { |item| item.quantity * item.book_price }
  end

  def total_price
    subtotal_price - discount
  end
end
