class Addresses::BillingAddressesController < ApplicationController

  def create
    @billing_address = current_user.billing_addresses.new(address_params)
    if @billing_address.save
      flash[:notice] = "Successfully created an #{address_params[:type]} address"
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
