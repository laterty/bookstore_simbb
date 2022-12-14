# frozen_string_literal: true

class CouponsController < ApplicationController
  before_action :undefined_coupon, unless: :coupon

  def update
    if coupon_form.save
      redirect_with_flash(notice: 'goddamn, okay, you will get your discount')
    else
      redirect_with_flash(alert: coupon_form.errors[:cart_id].to_sentence)
    end
  end

  private

  def coupon_form
    @coupon_form ||= CouponForm.new(coupon, { cart_id: permitted_params[:cart_id] })
  end

  def redirect_with_flash(notice: nil, alert: nil)
    flash_options =  { notice: notice, alert: alert }.compact_blank
    redirect_to cart_path(@current_cart), **flash_options
  end

  def coupon
    @coupon ||= Coupon.find_by(code: permitted_params[:code])
  end

  def undefined_coupon
    redirect_with_flash(alert: 'did you really think that you can trick with me, motherfucker?')
  end

  def permitted_params
    binding.pry
    params.require(:coupon).permit(:code).merge(cart_id: @current_cart.id)
  end
end
