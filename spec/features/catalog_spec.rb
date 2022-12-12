# frozen_string_literal: true

RSpec.describe 'Catalog', type: :feature do
  describe 'link to catalog from menu' do
    before do
      create_list(:book, 6)
      visit root_path
      within('div.hidden-xs') do
        find('.nav.navbar-nav').click_link(I18n.t('layouts.header.navigation_shop'))
        find('ul.dropdown-menu').all('a').first.click
      end
    end

    it { expect(page).to have_current_path books_path }
  end

  describe 'sorting by price asc' do
    before do
      create_list(:book, 6)
      visit books_path
      within('div.hidden-xs.clearfix') do
        find('a.dropdown-toggle.lead.small').click
        find('ul.dropdown-menu').click_link(I18n.t('books.partials.desktop.sort.price_asc'))
      end
    end

    let(:books_price_low_to_high) { Book.order('price ASC') }

    it 'Change the order of displayed items price: low to high' do
      expect(page).to have_current_path books_path, ignore_query: true
      expect(all('.title')[5].text).to eq books_price_low_to_high[5].title
    end
  end

  describe 'sorting by price desc' do
    before do
      create_list(:book, 6)
      visit books_path
      within('div.hidden-xs.clearfix') do
        find('a.dropdown-toggle.lead.small').click
        find('ul.dropdown-menu').click_link(I18n.t('books.partials.desktop.sort.price_desc'))
      end
    end

    let(:books_price_high_to_low) { Book.order('price DESC') }

    it 'Change the order of displayed items price: high to low' do
      expect(page).to have_current_path books_path, ignore_query: true
      expect(all('.title')[3].text).to eq books_price_high_to_low[3].title
    end
  end

  describe 'cover_image' do
    context 'when book has cover_image' do
      let!(:book) { create(:book) }
      let(:book_image) { /#{book.cover_image}/ }
      let(:showed_book_image) { page.find('img', class: 'img-shadow general-thumbnail-img')['src'] }

      before { visit books_path }

      it 'user can see cover_image on page' do
        expect(showed_book_image).to match(book_image)
      end
    end

    context 'when book without cover_image' do
      let(:book_image_default) { /#{default_book_image}/ }
      let(:book_image) { page.find('img', class: 'img-shadow general-thumbnail-img')['src'] }

      before do
        create(:book, cover_image: nil)
        visit books_path
      end

      it 'user can see default image on page' do
        expect(book_image).to match(book_image_default)
      end
    end
  end
end
