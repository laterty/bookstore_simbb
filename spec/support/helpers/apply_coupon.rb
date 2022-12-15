# frozen_string_literal: true

module Helpers
  module ApplyCoupon
    def apply_coupon(coupon_code)
      within('form.simple_form.coupon') do
        fill_in I18n.t('carts.partials.coupon_form.label'), with: coupon_code
        click_button(I18n.t('carts.partials.coupon_form.submit_button'))
      end
    end
  end
end
