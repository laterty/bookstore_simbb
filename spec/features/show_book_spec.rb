# frozen_string_literal: true

RSpec.describe 'Book page', type: :feature do
  let(:book) { create(:book) }

  before { visit book_path(book) }

  describe 'truncatable description', js: true do
    it 'truncate books description' do
      expect(page).to have_css('#truncate_description')
      expect(page).to have_no_css('#full_description')
    end
  end

  describe 'show full description after click link', js: true do
    before { find_by_id('book_read_more').click }

    it { expect(page).to have_no_css('#truncate_description') }
  end
end
