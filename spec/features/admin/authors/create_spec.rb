# frozen_string_literal: true

RSpec.describe 'create', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let(:author) { attributes_for(:author)[:name] }

  before do
    admin_log_in(admin_user)
    visit new_admin_author_path
  end

  context 'when admin fill all data and click create author' do
    let(:expected_result_message) { find('div', class: 'flash flash_notice').text }
    let(:result_author) { Author.first.name }

    before do
      within('#new_author') do
        fill_in 'author[name]', with: author
        find('#author_submit_action input').click
      end
    end

    it 'show message about good create' do
      expect(page).to have_text(expected_result_message)
    end

    it 'admin create new author' do
      expect(result_author).to eq(author)
    end
  end

  context 'when admin click cancel' do
    let(:author_exist?) { Author.exists? }

    before do
      within('#new_author') do
        fill_in 'author[name]', with: author
        find('.cancel a').click
      end
    end

    it 'admin cancel create new category' do
      expect(author_exist?).to be_falsey
    end
  end
end
