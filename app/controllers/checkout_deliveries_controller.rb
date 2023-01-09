# frozen_string_literal: true

class CheckoutDeliveriesController < ApplicationController
  before_action :current_order

  def edit; end

  def update
    binding.pry
    if @current_order.update(delivery_id: delivery_params[:delivery_id])
      @current_order.to_payment!
      redirect_to new_checkout_payment_path
    else
      render :edit
    end
  end

  private

  def delivery_params
    params.permit(:delivery_id)
  end
end
