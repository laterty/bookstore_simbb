# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :find_line_item, except: :create

  def create
    @chosen_book = Book.find(permitted_params[:book_id])
    LineItemService.call(line_item_params).save
    redirect_to cart_path(@current_cart)
  end

  def destroy
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @line_item.quantity += LineItem::QUANTITY_STEP
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @line_item.quantity -= LineItem::QUANTITY_STEP if @line_item.quantity > LineItem::MIN_QUANTITY
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  private

  def find_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    { cart: @current_cart, book: @chosen_book, quantity: permitted_params[:quantity] }
  end

  def permitted_params
    params.require(:line_item).permit(:quantity, :book_id)
  end
end
