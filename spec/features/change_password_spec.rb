# frozen_string_literal: true

describe 'Change password' do
  let(:user) { create(:user) }
  let(:empty_string) { '' }
  let(:current_password) { user.password }
  let(:invalid_password) { 'yolo12' }
  let(:new_password) { attributes_for(:user)[:password] }
  let(:invalid_confirmation_new_password) { 'yolO123*' }
  let(:valid_confirmation_new_password) { new_password }

  before { log_in(user) }

  describe 'visitor puts empty values in all fields' do
    before do
      visit privacy_settings_path
      within '#change_password_form' do
        click_button(I18n.t('users.partials.change_password_form.submit_button'))
      end
    end

    it do
      expect(page).to have_current_path update_user_password_path
      expect(page).to have_content I18n.t('validation.blank')
    end
  end

  describe 'visitor puts empty values in old_passwords field' do
    before do
      visit privacy_settings_path
      within '#change_password_form' do
        fill_in I18n.t('users.partials.change_password_form.label.current_password'), with: empty_string
        fill_in I18n.t('users.partials.change_password_form.label.password'), with: new_password
        fill_in I18n.t('users.partials.change_password_form.label.password_confirmation'),
                with: valid_confirmation_new_password
        click_button(I18n.t('users.partials.change_password_form.submit_button'))
      end
    end

    it do
      expect(page).to have_current_path update_user_password_path
      expect(page).to have_content I18n.t('validation.blank')
    end
  end

  describe 'visitor puts unequal passwords' do
    before do
      visit privacy_settings_path
      within '#change_password_form' do
        fill_in I18n.t('users.partials.change_password_form.label.current_password'), with: current_password
        fill_in I18n.t('users.partials.change_password_form.label.password'), with: new_password
        fill_in I18n.t('users.partials.change_password_form.label.password_confirmation'),
                with: invalid_confirmation_new_password
        click_button(I18n.t('users.partials.change_password_form.submit_button'))
      end
    end

    it do
      expect(page).to have_current_path update_user_password_path
      expect(page).to have_content I18n.t('validation.password.confirmation')
    end
  end

  describe 'visitor puts invalid new passwords' do
    before do
      visit privacy_settings_path
      within '#change_password_form' do
        fill_in I18n.t('users.partials.change_password_form.label.current_password'), with: current_password
        fill_in I18n.t('users.partials.change_password_form.label.password'), with: invalid_password
        fill_in I18n.t('users.partials.change_password_form.label.password_confirmation'), with: invalid_password
        click_button(I18n.t('users.partials.change_password_form.submit_button'))
      end
    end

    it do
      expect(page).to have_current_path update_user_password_path
      expect(page).to have_content I18n.t('validation.password.complexity')
    end
  end

  describe 'visitor puts wrong current password' do
    before do
      visit privacy_settings_path
      within '#change_password_form' do
        fill_in I18n.t('users.partials.change_password_form.label.current_password'), with: invalid_password
        fill_in I18n.t('users.partials.change_password_form.label.password'), with: new_password
        fill_in I18n.t('users.partials.change_password_form.label.password_confirmation'),
                with: valid_confirmation_new_password
        click_button(I18n.t('users.partials.change_password_form.submit_button'))
      end
    end

    it do
      expect(page).to have_current_path update_user_password_path
      expect(page).to have_content I18n.t('validation.password.current')
    end
  end

  describe 'visitor did everything right' do
    before do
      visit privacy_settings_path
      within '#change_password_form' do
        fill_in I18n.t('users.partials.change_password_form.label.current_password'), with: current_password
        fill_in I18n.t('users.partials.change_password_form.label.password'), with: new_password
        fill_in I18n.t('users.partials.change_password_form.label.password_confirmation'),
                with: valid_confirmation_new_password
        click_button(I18n.t('users.partials.change_password_form.submit_button'))
      end
    end

    it do
      expect(page).to have_current_path new_user_session_path
      expect(page).to have_content I18n.t('users.successful.update_password')
    end
  end
end
