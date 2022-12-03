# frozen_string_literal: true

RSpec.describe 'edit', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let!(:book) { create(:book) }

  let(:new_title) { 'yolo' }

  let(:submit_button) { find('#book_submit_action input').value }
  let(:cancel_button) { find('.cancel a').text }

  before do
    admin_log_in(admin_user)
    visit edit_admin_book_path(book)
  end

  it 'edit page show book name' do
    expect(page).to have_text(book.title)
  end

  it 'page has button update book' do
    expect(page).to have_button(submit_button)
  end

  it 'page has button cancel' do
    expect(page).to have_link(cancel_button)
  end

  context 'when admin want update book and click update book' do
    before do
      within('#edit_book') do
        fill_in 'book[title]', with: new_title
        click_button(submit_button)
      end
    end

    it 'change name' do
      expect(page).to have_text(new_title)
    end
  end

  context 'when admin want update but click cancel' do
    before do
      within('#edit_book') do
        fill_in 'book[title]', with: new_title
        click_link(cancel_button)
      end
    end

    it 'not change name' do
      expect(page).not_to have_text(new_title)
    end
  end
end
