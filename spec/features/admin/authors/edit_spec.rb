# frozen_string_literal: true

RSpec.describe 'edit', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let!(:author) { create(:author) }

  let(:new_name) { attributes_for(:author)[:name] }
  let(:update_button) { find('#author_submit_action input').value }
  let(:cancel_button) { find('.cancel a').text }

  before do
    admin_log_in(admin_user)
    visit edit_admin_author_path(author)
  end

  it 'edit page show author name' do
    expect(page).to have_text(author.name)
  end

  it 'page has button update author' do
    expect(page).to have_button(update_button)
  end

  it 'page has button cancel' do
    expect(page).to have_link(cancel_button)
  end

  context 'when admin want update author and click update author' do
    before do
      within('#edit_author') do
        fill_in 'author[name]', with: new_name
        click_button(update_button)
      end
    end

    it 'change name' do
      expect(page).to have_text(new_name)
    end
  end

  context 'when admin want update but click cancel' do
    before do
      within('#edit_author') do
        fill_in 'author[name]', with: new_name
        click_link(cancel_button)
      end
    end

    it 'not change name' do
      expect(page).not_to have_text(new_name)
    end
  end
end
