# frozen_string_literal: true

class LineItemDecorator < Draper::Decorator
  delegate_all
  delegate :price, to: :book, prefix: true

  def subtotal_price
    quantity * book_price
  end
end
