# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @cart = @current_cart.decorate
    @line_items = @cart.line_items
  end
end
