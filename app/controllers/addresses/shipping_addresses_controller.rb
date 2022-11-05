module Addresses
  class ShippingAddressesController < ApplicationController
    def create
      @shipping_address = current_user.shipping_addresses.new(address_params)
      if @shipping_address.save
        flash[:notice] = "Successfully created an #{address_params[:type]} address"
        redirect_to '/settings/addresses'
      else
        render 'addresses/index'
      end
    end

    private

    def address_params
      params.require(:address).permit(:first_name, :last_name, :type, :address, :city, :country, :phone, :zip)
    end
  end
end
