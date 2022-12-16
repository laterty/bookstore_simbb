# frozen_string_literal: true

RSpec.describe LineItemDecorator do
  let(:line_item) { create(:line_item).decorate }

  describe '#subtotal_price' do
    let(:subtotal_price) { line_item.subtotal_price }
    let(:expected_subtotal_price) { line_item.quantity * line_item.book.price }

    it 'return line_items subtotal price' do
      expect(subtotal_price).to eq(expected_subtotal_price)
    end
  end
end
