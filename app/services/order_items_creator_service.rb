# frozen_string_literal: true

class OrderItemsCreatorService < ApplicationService
  attr_reader :cart, :order

  def initialize(params)
    @order = params[:order]
    @cart = params[:cart]
  end

  def call
    create_order_items
  end

  private

  def create_order_items
    cart.line_items.each do |line_item|
      OrderItem.create(order_item_params(line_item))
    end
  end

  def order_item_params(line_item)
    { order:,
      book: line_item.book,
      quantity: line_item.quantity,
      price: line_item.book.price,
      title: line_item.book.title,
      description: line_item.book.description }
  end
end
