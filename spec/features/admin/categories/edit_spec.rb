# frozen_string_literal: true

RSpec.describe 'edit', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let!(:category) { create(:category) }

  let(:new_name) { 'Yolo' }
  let(:update_button) { find('#category_submit_action input').value }
  let(:cancel_button) { find('.cancel a').text }

  before do
    admin_log_in(admin_user)
    visit edit_admin_category_path(category)
  end

  it 'edit page show category name' do
    expect(page).to have_text(category.name)
  end

  it 'page has button update category' do
    expect(page).to have_button(update_button)
  end

  it 'page has button cancel' do
    expect(page).to have_link(cancel_button)
  end

  context 'when admin want update category and click update category' do
    before do
      within('#edit_category') do
        fill_in 'category[name]', with: new_name
        click_button(update_button)
      end
    end

    it 'change name' do
      expect(page).to have_text(new_name)
    end
  end

  context 'when admin want update but click cancel' do
    before do
      within('#edit_category') do
        fill_in 'category[name]', with: new_name
        click_link(cancel_button)
      end
    end

    it 'not change name' do
      expect(page).not_to have_text(new_name)
    end
  end
end
