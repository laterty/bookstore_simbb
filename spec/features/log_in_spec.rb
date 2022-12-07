# frozen_string_literal: true

RSpec.describe 'Log in', type: :feature do
  let(:user) { create(:user) }

  describe 'Visitor logins successfully via log in form' do
    before do
      visit new_user_session_path
      within '#new_user' do
        fill_in I18n.t('devise.sessions.new.label.email'), with: user.email
        fill_in I18n.t('devise.sessions.new.label.password'), with: user.password
        click_button(I18n.t('devise.sessions.new.log_in'))
      end
    end

    it do
      expect(page).to have_current_path root_path, ignore_query: true
      expect(page).not_to have_content I18n.t('layouts.header.log_in')
      expect(page).to have_content I18n.t('layouts.header.log_out')
      expect(page).to have_content I18n.t('devise.sessions.signed_in')
    end
  end

  describe 'Visitor forgots password' do
    before do
      visit new_user_session_path
      click_link(I18n.t('devise.sessions.new.forgot_password'))
      within '#new_user' do
        fill_in I18n.t('devise.passwords.new.email_placeholder'), with: user.email
        click_button(I18n.t('devise.passwords.new.submit_button'))
      end
    end

    it do
      expect(page).to have_current_path new_user_session_path, ignore_query: true
      expect(page).to have_content I18n.t('devise.passwords.send_instructions')
    end
  end
end
