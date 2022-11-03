class AddressesController < ApplicationController
  def index
    @shipping_address = current_user.shipping_addresses.new(type: 'shipping')
    @billing_address = current_user.billing_addresses.new(type: 'billing')
  end

=begin
     def create
    params[:type] == 'billing' ? create_billing_address : create_shipping_address
    if @address.save
      flash[:notice] = "Successfully created an #{address_params[:type]} address"
      redirect_to '/settings/addresses'
    else
      render :index
    end
  end
=end

  private

  def create_billing_address
    address_params.merge!(type: 'billing')
    @address = current_user.billing_addresses.new(address_params)
  end

  def create_shipping_address
    address_params.merge!(type: 'shipping')
    @address = current_user.shipping_addresses.new(address_params)
  end

  def address_params
    params.require(:address).permit(:first_name, :last_name, :address, :city, :country, :phone, :zip)
  end
end
