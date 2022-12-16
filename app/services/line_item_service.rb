# frozen_string_literal: true

class LineItemService < ApplicationService
  def initialize(params)
    @cart = params[:cart]
    @book = params[:book]
    @quantity = params[:quantity]
  end

  def call
    book_already_in_cart? ? update_line_item : new_line_item
  end

  private

  attr_reader :cart, :book, :quantity

  def new_line_item
    @line_item = LineItem.new(cart:, book:, quantity: quantity || LineItem::MIN_QUANTITY)
  end

  def update_line_item
    @line_item = cart.line_items.object.find_by(book_id: book.id)
    @line_item.quantity += quantity ? quantity.to_i : LineItem::QUANTITY_STEP
    @line_item
  end

  def book_already_in_cart?
    cart.books.include?(book)
  end
end
