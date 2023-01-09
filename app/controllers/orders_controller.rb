# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :return_customer

  def create
    @current_order = OrderCreatorService.new(order_params).call
    session[:current_order_id] = @current_order.id
    redirect_to new_checkout_address_path
  end

  private

  def return_customer
    session[:user_return_to] = new_order_path
    redirect_to checkout_login_path unless user_signed_in?

    @customer = current_user
  end

  def order_params
    { user: current_user, cart: current_cart }
  end
end
