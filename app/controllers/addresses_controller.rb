# frozen_string_literal: true

class AddressesController < ApplicationController
  def edit; end

  def create
    if typed_form.save
      redirect_to edit_settings_address_path
    else
      flash[:alert] = 'IT WORKS DAMN'
      render :edit
    end
  end

  def update
    if typed_form.save
      redirect_to edit_settings_address_path
    else
      flash[:alert] = 'IT WORKS DAMN'
      render :edit
    end
  end
  #   def shipping_address_locals
  #     if current_user.shipping_address
  #       return { address: @shipping_address_form.nil? ? current_user.shipping_address : @shipping_address_form , type: 'ShippingAddress' }
  #     else
  #       return { address: @shipping_address_form.nil? ? AddressForm.new(Address.new(type: 'ShippingAddress')) : @shipping_address_form , type: 'ShippingAddress' }
  #     end
  #   end
  #
  #   def billing_address_locals
  #     if current_user.billing_address
  #       return { address: @billing_address_form.nil? ? current_user.billing_address : @billing_address_form , type: 'BillingAddress' }
  #     else
  #       return { address: @billing_address_form.nil? ? AddressForm.new(Address.new(type: 'BillingAddress')) : @billing_address_form , type: 'BillingAddress' }
  #     end
  #   end

  private

  def typed_form
    if billing_type?
      @billing_address_form = AddressForm.new(address, address_params)
    else
      @shipping_address_form = AddressForm.new(address, address_params)
    end
  end

  def address
    @address ||= if Address.where(user: current_user, type: address_params[:type]).any?
                   Address.find_by(user: current_user, type: address_params[:type])
                 else
                   Address.new(user: current_user, type: address_params[:type])
                 end
  end

  def billing_type?
    address_params[:type] == 'BillingAddress'
  end

  def address_params
    params.require(:address).permit(:first_name, :last_name, :address, :city, :country, :phone, :zip, :type)
  end
end
