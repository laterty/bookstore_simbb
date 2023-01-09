# frozen_string_literal: true

class CheckoutPaymentsController < ApplicationController
  before_action :current_order

  def new; end

  def create
    if credit_card_form.save
      @current_order.to_confirm!
      redirect_to checkout_confirm_path
    else
      render :new
    end
  end

  private

  def credit_card_form
    @credit_card_form ||= CreditCardForm.new(credit_card, payment_params)
  end

  def credit_card
    @credit_card ||= CreditCard.find_or_initialize_by(order_id: payment_params[:order_id])
  end

  def payment_params
    params.require(:payment).permit(:number, :name, :expire_date, :cvv).merge(order_id: @current_order.id)
  end
end
