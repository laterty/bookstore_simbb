# frozen_string_literal: true

RSpec.describe CartDecorator do
  let!(:coupon) { create(:coupon, discount: 50) }
  let!(:book1) { create(:book, price: 20) }
  let!(:book2) { create(:book, price: 40) }

  let!(:line_item1) { create(:line_item, book: book1, quantity: 2) }
  let!(:line_item2) { create(:line_item, book: book2, quantity: 3) }

  let!(:line_items) { [line_item1, line_item2] }
  let!(:cart) { create(:cart, coupon:, line_items:).decorate }

  describe '#subtotal_price' do
    let(:expected_subtotal_price) { 160 }

    it 'give subtotal money for line_items' do
      expect(cart.subtotal_price).to eq(expected_subtotal_price)
    end
  end

  describe '#discount' do
    context 'when coupon present' do
      let(:expected_discount) { 80 }

      it 'shows how much money you have saved' do
        expect(cart.discount).to eq(expected_discount)
      end
    end

    context 'when coupon not present' do
      let(:another_cart) { create(:cart).decorate }
      let(:expected_discount) { 0 }

      it 'shows how much money you have saved' do
        expect(another_cart.discount).to eq(expected_discount)
      end
    end
  end

  describe '#total_price' do
    let(:expected_total_price) { 80 }

    it 'give total money for cart' do
      expect(cart.total_price).to eq(expected_total_price)
    end
  end
end
