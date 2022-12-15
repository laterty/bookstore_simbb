# frozen_string_literal: true

RSpec.describe 'Cart page', type: :feature do
  let!(:cart) { create(:cart).decorate }
  let!(:line_item) { create(:line_item, cart:).decorate }
  let(:total_price) do
    within('table.general-summary-table') do
      find_by_id('cart-total').text.to_d
    end
  end

  context 'without coupon' do
    before do
      page.set_rack_session(cart_id: cart.id)
      visit cart_path(cart)
    end

    it 'shows total price' do
      expect(total_price).to eq(line_item.subtotal_price)
    end
  end

  context 'with coupon' do
    let(:coupon) { create(:coupon) }
    let(:coupon_code) { coupon.code }
    let(:discount) do
      within('table.general-summary-table') do
        find_by_id('cart-discount').text.to_d
      end
    end

    before do
      page.set_rack_session(cart_id: cart.id)
      visit cart_path(cart)
      apply_coupon
    end

    it 'shows total price' do
      expect(total_price).to eq(cart.total_price)
    end

    it 'shows discount' do
      expect(discount).to eq(cart.discount)
    end
  end
end
