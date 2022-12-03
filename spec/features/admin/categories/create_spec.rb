# frozen_string_literal: true

RSpec.describe 'create', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let(:category) { 'Yolo' }

  before do
    admin_log_in(admin_user)
    visit new_admin_category_path
  end

  context 'when admin fill all data and click create category' do
    let(:expected_result_message) { find('div', class: 'flash flash_notice').text }
    let(:result_category) { Category.first.name }

    before do
      within('#new_category') do
        fill_in 'category[name]', with: category
        find('#category_submit_action input').click
      end
    end

    it 'show message about good create' do
      expect(page).to have_text(expected_result_message)
    end

    it 'admin create new category' do
      expect(result_category).to eq(category)
    end
  end

  context 'when admin click cancel' do
    let(:category_exist?) { Category.exists? }

    before do
      within('#new_category') do
        fill_in 'category[name]', with: category
        find('.cancel a').click
      end
    end

    it 'admin cancel create new category' do
      expect(category_exist?).to be_falsey
    end
  end
end
