# frozen_string_literal: true

RSpec.describe 'Create', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let!(:category) { create(:category) }
  let!(:author) { create(:author) }

  let(:book_title) { attributes_for(:book)[:title] }

  before do
    admin_log_in(admin_user)
    visit new_admin_book_path
  end

  context 'when admin fill all data and click Create Book' do
    let(:notice_message) { find('div', class: 'flash flash_notice').text }

    let(:created_books_title) { Book.first.title }

    before do
      within('#new_book') do
        fill_in 'book[title]', with: book_title
        fill_in 'book[price]', with: attributes_for(:book)[:price]
        fill_in 'book[description]', with: attributes_for(:book)[:description]
        fill_in 'book[dimensions]', with: attributes_for(:book)[:dimensions]
        fill_in 'book[year_of_publication]', with: attributes_for(:book)[:year_of_publication]
        fill_in 'book[materials]', with: attributes_for(:book)[:materials]
        check(author.name)
        select category.name, from: 'book[category_id]'
        find('#book_submit_action input').click
      end
    end

    it 'show message about good create' do
      expect(page).to have_text(notice_message)
    end

    it 'admin create new book' do
      expect(created_books_title).to eq(book_title)
    end
  end

  context 'when admin click cancel' do
    let(:book_exists?) { Book.exists? }

    before do
      within('#new_book') do
        fill_in 'book[title]', with: book_title
        fill_in 'book[price]', with: attributes_for(:book)[:price]
        fill_in 'book[description]', with: attributes_for(:book)[:description]
        fill_in 'book[dimensions]', with: attributes_for(:book)[:dimensions]
        fill_in 'book[year_of_publication]', with: attributes_for(:book)[:year_of_publication]
        fill_in 'book[materials]', with: attributes_for(:book)[:materials]
        check(author.name)
        select category.name, from: 'book[category_id]'
        find('.cancel a').click
      end
    end

    it 'doesnt save book' do
      expect(book_exists?).to be_falsey
    end
  end
end
