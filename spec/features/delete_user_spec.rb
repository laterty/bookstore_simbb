# frozen_string_literal: true

describe 'Delete user' do
  let!(:user) { create(:user) }
  let(:delete_form) { find_by_id('delete_account_form') }

  before { log_in(user) }

  context 'when checkbox unchecked' do
    before do
      visit privacy_settings_path
    end

    it 'delete button is disabled' do
      expect(delete_form).to have_css('.disabled')
    end
  end

  context 'when checkbox checked', js: true do
    before do
      visit privacy_settings_path
      find('.checkbox-icon').click
    end

    it 'delete button is disabled' do
      expect(delete_form).to have_no_css('.disabled')
    end
  end

  context 'when user delete his account', js: true do
    let(:user_exist?) { User.exists?(id: user.id) }

    before do
      visit privacy_settings_path
      within delete_form do
        find('.checkbox-icon').click
        find_by_id('button_for_delete_account').click
      end
    end

    it 'delete button is disabled' do
      expect(page).to have_current_path root_path
      expect(page).to have_content I18n.t('users.successful.delete_user')
      expect(user_exist?).to be_falsey
    end
  end
end
