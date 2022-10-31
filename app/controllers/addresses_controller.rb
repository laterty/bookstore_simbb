class AddressesController < ApplicationController
  def index
    @address = Address.new
  end

  def create
    params[:type] == 'billing' ? create_billing_address : create_shipping_address
    if @address.save
      flash[:notice] = "Successfully created an #{address_params[:type]} address"
      redirect_to '/settings/addresses'
    else
      render :index
    end
  end

  private

  def create_billing_address
    @address = current_user.billing_addresses.new(address_params)
  end

  def create_shipping_address
    @address = current_user.shipping_addresses.new(address_params)
  end

  def address_params
    params.require(:address).permit(:first_name, :last_name, :address, :city, :country, :phone, :zip)
  end
end
