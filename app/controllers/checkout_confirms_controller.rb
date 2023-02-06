# frozen_string_literal: true

class CheckoutConfirmsController < ApplicationController
  before_action :current_order

  def show; end

  def update
    @current_order.to_complete!
    redirect_to checkout_complete_path
  end
end
