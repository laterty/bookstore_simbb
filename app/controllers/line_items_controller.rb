# frozen_string_literal: true

class LineItemsController < ApplicationController
  def create
    chosen_book = Book.find(params[:book_id])
    if @current_cart.books.include?(chosen_book)
      @line_item = @current_cart.line_items.find_by(book_id: chosen_book)
      @line_item.quantity += permitted_params[:quantity].to_i
    else
      @line_item = LineItem.new(cart: @current_cart, book: chosen_book, quantity: permitted_params[:quantity])
    end
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity -= 1 if @line_item.quantity > 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end
  
  private

  def permitted_params
    params.require(:line_item).permit(:quantity, :book_id)
  end
end
