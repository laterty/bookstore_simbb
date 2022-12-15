# frozen_string_literal: true

RSpec.describe CouponForm, type: :model do
  let!(:current_cart) { create(:cart) }
  let(:params) { { code:, cart_id: current_cart.id } }
  let(:coupon_form) { described_class.new(coupon, { cart_id: params[:cart_id] }) }

  before { coupon_form.save }

  context 'when coupon doesnt have cart_id' do
    let(:coupon) { create(:coupon) }
    let(:code) { coupon.code }
    let(:coupons_cart_id) { Coupon.find_by(cart_id: current_cart_id).cart_id }
    let(:current_cart_id) { current_cart.id }

    it 'add to coupon cart_id' do
      expect(coupons_cart_id).to eq(current_cart_id)
    end
  end

  context 'when coupon already have cart_id' do
    let!(:coupon) { create(:coupon, cart: current_cart) }
    let(:code) { coupon.code }
    let(:has_carts_error) { coupon_form.errors.key?(:cart_id) }

    it 'has error' do
      expect(has_carts_error).to be_truthy
    end
  end
end
