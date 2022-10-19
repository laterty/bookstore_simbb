require 'rails_helper'

RSpec.describe 'Book page', type: :feature do
  let(:book) { create(:book) }

  it 'truncate books description' do
    visit book_path(book)

    expect(page).to have_css('#truncate_description')
  end

  it 'show full description after click link' do
    visit book_path(book)

    find_by_id('book_read_more').click

    expect(page).to have_no_css('#truncate_description')
  end
end
