# frozen_string_literal: true

class AddressesController < ApplicationController
  def edit; end

  def create
    if typed_form.save
      redirect_to edit_settings_address_path,
                  notice: I18n.t('addresses.successful.create_address', type: address_params[:type])
    else
      render :edit
    end
  end

  def update
    if typed_form.save
      redirect_to edit_settings_address_path,
                  notice: I18n.t('addresses.successful.update_address', type: address_params[:type])
    else
      render :edit
    end
  end

  private

  def typed_form
    if billing_type?
      @billing_address_form = AddressForm.new(address, address_params)
    else
      @shipping_address_form = AddressForm.new(address, address_params)
    end
  end

  def address
    @address ||= Address.find_or_initialize_by(user: current_user, type: address_params[:type])
  end

  def billing_type?
    address_params[:type] == BillingAddress.name
  end

  def address_params
    params.require(:address).permit(:first_name, :last_name, :address, :city, :country, :phone, :zip, :type)
  end
end
