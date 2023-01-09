# frozen_string_literal: true

class OrderCreatorService < ApplicationService
  attr_reader :cart, :user, :order

  def initialize(params)
    @cart = params[:cart]
    @user = params[:user]
  end

  def call
    build_order
    order
  end

  private

  def build_order
    create_order
    create_order_items
  end

  def create_order
    @order = Order.create(order_params)
  end

  def create_order_items
    OrderItemsCreatorService.new(cart:, order:).call
  end

  def order_params
    cart.coupon ? { user:, discount: cart.coupon.discount } : { user: }
  end
end
