class AddressesController < ApplicationController
  def index
    # @shipping_address = current_user.shipping_address
    # @billing_address = current_user.billing_address
  end

  #      def create
  #     params[:type] == 'billing' ? create_billing_address : create_shipping_address
  #     if @address.save
  #       flash[:notice] = "Successfully created an #{address_params[:type]} address"
  #       redirect_to '/settings/addresses'
  #     else
  #       render :index
  #     end
  #   end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :address, :city, :country, :phone, :zip, :type)
  end
end
