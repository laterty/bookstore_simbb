RSpec.describe 'Catalog', type: :feature do
  before do
    create_list(:book, 6)
  end

  describe 'link to catalog from menu' do
    before do  
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
end
