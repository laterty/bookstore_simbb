# frozen_string_literal: true

class CheckoutAddressesController < ApplicationController
  before_action :current_order

  BILLING = :billing
  SHIPPING = :shipping

  def new
    @customer_billing_address = @current_order.user.billing_address
    @customer_shipping_address = @current_order.user.shipping_address
  end

  def create
    if address_form_billing.save && address_form_shipping.save
      @current_order.to_delivery!
      redirect_to edit_checkout_delivery_path
    else
      render :new
    end
  end

  private

  def address_form_billing
    @address_form_billing ||= AddressForm.new(address(BILLING), addres_params[BILLING])
  end

  def address_form_shipping
    return @address_form_shipping ||= AddressForm.new(address(SHIPPING), params_when_use_billing) if use_billing?

    @address_form_shipping ||= AddressForm.new(address(SHIPPING), addres_params[SHIPPING])
  end

  def address(type)
    Address.new(order: @current_order, type: addres_params[type][:type])
  end

  def use_billing?
    params[:order][:use_billing] == 'true'
  end

  def addres_params
    params.require(:order).permit(:use_billing,
                                    BILLING => %i[first_name last_name address city country zip phone type],
                                    SHIPPING => %i[first_name last_name address city country zip phone type])
  end

  def params_when_use_billing
    shipping_params = addres_params[BILLING]
    shipping_params[:type] = ShippingAddress.name
    shipping_params
  end
end
