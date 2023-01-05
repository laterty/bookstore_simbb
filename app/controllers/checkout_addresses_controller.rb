# frozen_string_literal: true

class CheckoutAddressesController < ApplicationController
  def show
    @order = Order.find(session[:current_order_id])
  end
end
