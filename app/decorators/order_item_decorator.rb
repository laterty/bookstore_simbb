# frozen_string_literal: true

class OrderItemDecorator < Draper::Decorator
  delegate_all

  def subtotal_price
    quantity * price
  end
end
