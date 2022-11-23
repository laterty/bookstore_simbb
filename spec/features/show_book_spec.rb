RSpec.describe 'Book page', type: :feature do
  let(:book) { create(:book) }
  before { visit book_path(book) }

  it 'truncate books description', js: true do
    expect(page).to have_css('#truncate_description')
    expect(page).to have_no_css('#full_description')
  end

  it 'show full description after click link', js: true do
    find_by_id('book_read_more').click
    expect(page).to have_no_css('#truncate_description')
  end
end
