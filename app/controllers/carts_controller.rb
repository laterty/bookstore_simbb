# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @cart = @current_cart
    @line_items = @cart.line_items.decorate
  end
end
