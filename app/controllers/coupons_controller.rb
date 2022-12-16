# frozen_string_literal: true

class CouponsController < ApplicationController
  before_action :undefined_coupon, unless: :coupon

  def update
    if coupon_form.save
      redirect_with_flash(notice: I18n.t('carts.coupon.valid_coupon'))
    else
      redirect_with_flash(alert: coupon_form.errors[:cart_id].to_sentence)
    end
  end

  private

  def coupon_form
    @coupon_form ||= CouponForm.new(coupon, { cart_id: permitted_params[:cart_id] })
  end

  def redirect_with_flash(notice: nil, alert: nil)
    flash_options =  { notice:, alert: }.compact_blank
    redirect_to cart_path(@current_cart), **flash_options
  end

  def coupon
    @coupon ||= Coupon.find_by(code: permitted_params[:code])
  end

  def undefined_coupon
    redirect_with_flash(alert: I18n.t('carts.coupon.undefined_coupon'))
  end

  def permitted_params
    params.require(:coupon).permit(:code).merge(cart_id: @current_cart.id)
  end
end
