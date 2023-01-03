# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :return_customer

  def new; binding.pry; end

  private

  def return_customer
    session[:user_return_to] = new_order_path
    redirect_to checkout_login_path unless user_signed_in?

    @customer = current_user
  end
end
