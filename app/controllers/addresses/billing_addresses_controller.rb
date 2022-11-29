# frozen_string_literal: true

module Addresses
  class BillingAddressesController < ApplicationController
    def create
      @billing_address = current_user.billing_addresses.new(address_params)
      if @billing_address.save
        flash[:notice] = I18n.t('addresses.successful.create_address', type: address_params[:type])
        redirect_to '/settings/addresses'
      else
        render 'addresses/index'
      end
    end

    private

    def address_params
      params.require(:address).permit(:first_name, :last_name, :address, :city, :country, :phone, :zip, :type)
    end
  end
end
