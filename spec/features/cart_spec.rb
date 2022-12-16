# frozen_string_literal: true

RSpec.describe 'Cart page', type: :feature do
  let!(:cart) { create(:cart).decorate }
  let!(:line_item) { create(:line_item, cart:).decorate }

  before { page.set_rack_session(cart_id: cart.id) }

  context 'when cart isnt empty' do
    let(:book_title) { cart.books.first.title }
    let(:book_quantity) { line_item.quantity }
    let(:book_count) { find("input.quantity-input#line-item-#{line_item.id}").value.to_i }
    let(:total_price) do
      within('table.general-summary-table') do
        find_by_id('cart-total').text.to_i
      end
    end

    before do
      visit cart_path(cart)
    end

    it 'shows line item' do
      expect(page).to have_text(book_title)
      expect(book_count).to eq(book_quantity)
    end
  end

  context 'when user delete line_item', hidden: false do
    before do
      visit cart_path(cart)
      find('a.close', match: :first).click
    end

    it 'redirect ro cart page' do
      expect(page).to have_current_path(cart_path(cart))
    end

    it 'deleted line item' do
      expect(page).to have_no_content(line_item.book.title)
    end
  end

  context 'when user change line item quantity', js: true do
    describe 'increment quantity' do
      before do
        visit cart_path(cart)
        find('i.fa.fa-plus').click
      end

      let(:line_item_quantity) { find("input.quantity-input#line-item-#{line_item.id}").value.to_i }
      let(:expected_line_item_quantity) { line_item.quantity + LineItem::QUANTITY_STEP }

      it 'increase line item quantity' do
        expect(line_item_quantity).to eq(expected_line_item_quantity)
      end
    end

    describe 'reduce quantity' do
      before do
        visit cart_path(cart)
        find('i.fa.fa-minus').click
      end

      let!(:expected_line_item_quantity) { line_item.quantity - LineItem::QUANTITY_STEP }
      let(:line_item_quantity) { find("input.quantity-input#line-item-#{line_item.id}").value.to_i }

      it 'increase line item quantity' do
        expect(line_item_quantity).to eq(expected_line_item_quantity)
      end
    end
  end
end
