# frozen_string_literal: true

RSpec.describe 'Cart page', type: :feature do
  let!(:cart) { create(:cart).decorate }
  let!(:line_item) { create(:line_item, cart:).decorate }

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
      page.set_rack_session(cart_id: cart.id)
      visit cart_path(cart)
    end

    it 'shows line item' do
      expect(page).to have_text(book_title)
      expect(book_count).to eq(book_quantity)
    end
  end

  context 'when user is going to delete line_item', hidden: false do
    before do
      page.set_rack_session(cart_id: cart.id)
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
end
