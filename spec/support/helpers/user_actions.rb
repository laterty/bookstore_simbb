# frozen_string_literal: true

module Helpers
  module UserActions
    def log_in(user)
      visit new_user_session_path
      within '#new_user' do
        fill_in I18n.t('devise.sessions.new.label.email'), with: user.email
        fill_in I18n.t('devise.sessions.new.label.password'), with: user.password
        click_button(I18n.t('devise.sessions.new.log_in'))
      end
    end

    def admin_log_in(admin)
      visit admin_root_path
      fill_in I18n.t('active_admin.devise.email.title'), with: admin.email
      fill_in I18n.t('active_admin.devise.password.title'), with: admin.password
      click_button(I18n.t('active_admin.devise.login.submit'))
    end
  end
end
