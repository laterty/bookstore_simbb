require 'rails_helper'

RSpec.describe 'Catalog', type: :feature do
  before { create_list(:book, 12) }

  let(:books_price_low_to_high) { Book.order('price') }
  let(:books_price_high_to_low) { Book.order('price DESC') }

  it 'Go to catalog from menu' do
    visit root_path

    within('div.hidden-xs') do
      find('.nav.navbar-nav').click_link('Shop')
      find('ul.dropdown-menu').all('a').first.click
    end

    expect(page).to have_current_path books_path, ignore_query: true
  end

  it 'Change the order of displayed items' do
    visit books_path
    within('div.hidden-xs.clearfix') do
      find('a.dropdown-toggle.lead.small').click
      find('ul.dropdown-menu').click_link('Price: Low to high')
    end
    expect(page).to have_current_path books_path, ignore_query: true

    within('#books') do
      expect(all('.title')[5].text).to eq books_price_low_to_high[5].title
    end

    within('div.hidden-xs.clearfix') do
      find('a.dropdown-toggle.lead.small').click
      find('ul.dropdown-menu').click_link('Price: High to low')
    end

    within('#books') do
      expect(all('.title')[8].text).to eq books_price_high_to_low[8].title
    end
  end
end
